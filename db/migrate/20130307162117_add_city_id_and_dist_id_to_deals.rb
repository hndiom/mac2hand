class AddCityIdAndDistIdToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :city_id, :integer
    add_column :deals, :dist_id, :integer
  end
end
