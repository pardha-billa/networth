class AddMoreFieldsToFunds < ActiveRecord::Migration[7.0]
  def change
    add_column :funds, :fund_code, :integer
    add_column :funds, :goal_name, :string
    add_column :funds, :fund_type, :string
    add_column :funds, :folio_number, :integer
    add_reference :funds, :member, null: false, foreign_key: true
  end
end
