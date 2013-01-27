class RenameAndAddRelationToLists < ActiveRecord::Migration
  def change
    rename_table :lists, :deals
    add_column :deals, :want_id, :integer
    add_column :deals, :sell_id, :integer
    add_column :deals, :type_of, :string
  end
end
