class AddLatitudeAndLongitudeToDeal < ActiveRecord::Migration
  def change
    add_column :deals, :latitude, :float
    add_column :deals, :longitude, :float
    add_column :deals, :address, :string
  end
end
