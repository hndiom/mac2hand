# -*- encoding : utf-8 -*-
class AddCellphoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :cellphone, :string, :limit => 10
  end
end
