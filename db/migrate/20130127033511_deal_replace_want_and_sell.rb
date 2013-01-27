class DealReplaceWantAndSell < ActiveRecord::Migration
  def change
    remove_column :deals, :want_id
    remove_column :deals, :sell_id
    add_column :deals, :name, :string
    add_column :deals, :spec, :string
    add_column :deals, :warranty, :string
    add_column :deals, :deliver_method, :string
    add_column :deals, :accessories, :string
    add_column :deals, :original_receipt, :string
    add_column :deals, :contact_by, :string
    add_column :deals, :price, :integer
    add_column :deals, :user_id, :integer
    add_column :deals, :category_id, :integer
    add_column :deals, :detail, :text
    add_column :deals, :published, :boolean, :default => false
    add_column :deals, :published_at, :datetime
  end
end
