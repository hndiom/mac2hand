class ChangeTypeOfReceiptInDeals < ActiveRecord::Migration
  def change
    change_column :deals, :original_receipt, :string
  end
end
