class AddRunningNavToFunds < ActiveRecord::Migration[7.0]
  def change
    add_column :funds, :nav_at, :date
    add_column :funds, :nav, :float
  end
end
