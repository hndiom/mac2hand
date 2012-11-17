class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :deal_id
      t.string :file_name
      t.integer :file_width
      t.integer :file_height
      t.timestamps
    end
  end
end
