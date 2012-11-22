# -*- encoding : utf-8 -*-
class AddReleaseDateToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :warranty, :string
    add_column :deals, :accessories, :string
    add_column :deals, :original_receipt, :boolean
  end
end
