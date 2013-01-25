class RenameDealIdToSellIdInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :deal_id, :sell_id
  end
end
