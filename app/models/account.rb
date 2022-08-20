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

  def deposit_for(amount)
    Account.transaction do
      deposits.create!(amount: amount)
      ledger_entries.debit.create!(account: Account.cash, amount: amount)
      ledger_entries.credit.create!(account: self, amount: amount)
      Account.cash.increment!(:balance, amount)
      decrement!(:balance, amount)
    end
  end
end
