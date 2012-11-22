# -*- encoding : utf-8 -*-
class AddMetaToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photo_size, :integer
    add_column :photos, :photo_content_type, :string

    add_column :photos, :photo_tiny_height, :integer
    add_column :photos, :photo_tiny_width, :integer
    add_column :photos, :photo_tiny_size, :integer
    add_column :photos, :photo_tiny_content_type, :string

    add_column :photos, :photo_medium_height, :integer
    add_column :photos, :photo_medium_width, :integer
    add_column :photos, :photo_medium_size, :integer
    add_column :photos, :photo_medium_content_type, :string

  end
end
