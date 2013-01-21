# -*- encoding : utf-8 -*-
class RemoveBoardIdAddTypeToDeals < ActiveRecord::Migration
  def change
    remove_column :deals, :board_id
    add_column :deals, :type, :string
    add_index :deals, :type
  end
end
