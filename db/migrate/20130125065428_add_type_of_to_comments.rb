class AddTypeOfToComments < ActiveRecord::Migration
  def change
    add_column :comments, :type_of, :string
  end
end
