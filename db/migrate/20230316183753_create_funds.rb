class CreateFunds < ActiveRecord::Migration[7.0]
  def change
    create_table :funds do |t|
      t.string :fund_name
      t.string :amc_name

      t.timestamps
    end
  end
end
