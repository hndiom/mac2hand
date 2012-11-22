# -*- encoding : utf-8 -*-
class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :deal_id
      t.string :photo
      t.integer :photo_width
      t.integer :photo_height
      t.timestamps
    end
  end
end
