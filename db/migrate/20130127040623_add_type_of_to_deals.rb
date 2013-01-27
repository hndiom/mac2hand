class AddTypeOfToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :type_of, :string
  end
end
