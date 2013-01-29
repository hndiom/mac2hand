class AddGmapsToDeals < ActiveRecord::Migration
  def change
  	    add_column :deals, :gmaps,  :boolean
  end
end
