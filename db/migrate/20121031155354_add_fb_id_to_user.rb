# -*- encoding : utf-8 -*-
class AddFbIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_id, :string
    add_column :users, :name, :string
  end
end
