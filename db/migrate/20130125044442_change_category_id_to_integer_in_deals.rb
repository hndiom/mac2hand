# -*- encoding : utf-8 -*-
class ChangeCategoryIdToIntegerInDeals < ActiveRecord::Migration
  def change
    change_column :deals, :category_id, :integer
  end

end
