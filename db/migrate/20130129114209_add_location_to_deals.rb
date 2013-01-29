class AddLocationToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :location, :string
  end
end
