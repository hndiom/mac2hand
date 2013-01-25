class RenameDealIdToSellIdInPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :deal_id, :sell_id
  end
end
