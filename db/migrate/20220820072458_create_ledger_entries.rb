class CreateLedgerEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :ledger_entries do |t|
      t.references :account, null: false, foreign_key: true
      t.integer :entry_type
      t.bigint :entryable_id
      t.string :entryable_type
      t.bigint :amount

      t.timestamps
    end
  end
end
