# -*- encoding : utf-8 -*-
class RemoveBoard < ActiveRecord::Migration
  def change
    drop_table :boards
  end

end
