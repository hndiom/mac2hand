class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.string :spec
      t.string :deliver_method
      t.integer :price
      t.text :detail
      t.integer :user_id
      t.integer :board_id
      t.timestamps
    end
  end
end
