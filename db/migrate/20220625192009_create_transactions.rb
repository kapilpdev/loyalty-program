class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.boolean :foreign_country, default: false
      t.decimal :amount, null: false
      t.datetime :invoice_date, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
