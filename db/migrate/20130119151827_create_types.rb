# -*- encoding : utf-8 -*-
class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.timestamps
    end
  end
end
