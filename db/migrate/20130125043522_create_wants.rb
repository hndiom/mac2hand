# -*- encoding : utf-8 -*-
class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.string :name
      t.string :spec
      t.string :warranty
      t.string :deliver_method
      t.string :accessories
      t.string :original_receipt
      t.integer :price
      t.text :detail
      t.integer :user_id
      t.integer :category_id
      t.string :contact_by
      t.boolean :published, :default => false
      t.datetime :published_at
      t.timestamps
    end
  end
end
