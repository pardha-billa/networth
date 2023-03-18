class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :fund, null: false, foreign_key: true
      t.date :transaction_date
      t.string :transaction_type
      t.float :amount
      t.float :nav

      t.timestamps
    end
  end
end
