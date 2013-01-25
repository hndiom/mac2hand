class AddWantIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :want_id, :integer
  end
end
