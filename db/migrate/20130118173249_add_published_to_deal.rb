# -*- encoding : utf-8 -*-
class AddPublishedToDeal < ActiveRecord::Migration
  def change
    add_column :deals, :published, :boolean, :default => false
  end
end
