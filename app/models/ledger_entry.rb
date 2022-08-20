class LedgerEntry < ApplicationRecord
  belongs_to :account

  enum entry_type: { debit: 1, credit: 2 }
end
