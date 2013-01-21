# -*- encoding : utf-8 -*-
class AddContactMethodToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :contact_by, :string
  end
end
