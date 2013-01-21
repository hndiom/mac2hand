# -*- encoding : utf-8 -*-
class RenameTypeInDeals < ActiveRecord::Migration
  def change
    rename_column :deals, :type, :category_id
    rename_table :types, :categories
  end
end
