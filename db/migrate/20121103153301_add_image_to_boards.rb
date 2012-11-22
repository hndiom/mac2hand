# -*- encoding : utf-8 -*-
class AddImageToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :image, :string
  end
end
