class LedgerEntry < ApplicationRecord
  belongs_to :account
  belongs_to :entryable, polymorphic: true

  enum entry_type: { debit: 1, credit: 2 }
end
