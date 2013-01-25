class RenameDealsToSells < ActiveRecord::Migration
  def change
    rename_table :deals, :sells
  end
end
