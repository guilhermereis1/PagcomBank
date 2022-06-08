class CreateWithdraws < ActiveRecord::Migration[6.1]
  def change
    create_table :withdraws, id: :uuid do |t|
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.decimal :amount, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
