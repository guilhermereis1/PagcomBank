class CreateBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :balances, id: :uuid do |t|
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.decimal :amount, null: false, default: 0.00, precision: 10, scale: 2
      t.text :deposit_references
      t.text :withdraw_references
      t.text :transfer_references

      t.timestamps
    end
  end
end
