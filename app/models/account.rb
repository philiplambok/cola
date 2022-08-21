class Account < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :ledger_entries
  has_many :deposits

  def self.cash
    Account.find_by(name: 'cash')
  end

  def self.publics
    Account.where.not(name: 'cash')
  end

  def sync_progress
    if Sidekiq::Queue.new.size.positive?
      broadcast_replace_to 'deposit', partial: 'home/reports_loading', target: 'reports'
      broadcast_replace_to 'deposit', partial: 'home/accounts_loading', target: 'accounts'
      return true
    end
    broadcast_replace_to 'deposit', partial: 'home/reports', target: 'reports'
    broadcast_replace_to 'deposit', partial: 'home/accounts', target: 'accounts'
  end

  def deposit_for(amount)
    Account.cash.increment!(:balance, amount, touch: true)
    decrement!(:balance, amount, touch: true)
    deposit = deposits.create!(amount: amount)
    LedgerEntry.create!(entry_type: :debit, account: Account.cash, amount: amount, entryable: deposit)
    LedgerEntry.create!(entry_type: :credit, account: self, amount: amount, entryable: deposit)
    sync_progress
  end

  def deposit_for_with_lock(amount)
    cash = Account.cash
    cash.with_lock do
      deposit = deposits.create!(amount: amount)
      LedgerEntry.create!(entry_type: :debit, account: cash, amount: amount, entryable: deposit)
      LedgerEntry.create!(entry_type: :credit, account: self, amount: amount, entryable: deposit)

      cash.balance += amount
      cash.save!
      self.balance -= amount
      save!
    end
    sync_progress
  end

  def deposit_for_without_locking(amount)
    cash = Account.cash
    deposit = deposits.create!(amount: amount)
    LedgerEntry.create!(entry_type: :debit, account: cash, amount: amount, entryable: deposit)
    LedgerEntry.create!(entry_type: :credit, account: self, amount: amount, entryable: deposit)

    cash.balance += amount
    cash.save!
    self.balance -= amount
    save!
    sync_progress
  end
end
