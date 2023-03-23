class CreateFixedAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :fixed_assets do |t|
      t.references :member, null: false, foreign_key: true
      t.string :goal_name
      t.float :amount
      t.string :source

      t.timestamps
    end
  end
end
