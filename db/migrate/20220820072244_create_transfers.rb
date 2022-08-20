class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.bigint :amount
      t.bigint :from_account_id
      t.bigint :to_account_id

      t.timestamps
    end
  end
end
