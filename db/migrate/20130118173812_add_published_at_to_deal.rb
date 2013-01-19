class AddPublishedAtToDeal < ActiveRecord::Migration
  def change
    add_column :deals, :published_at, :datetime
  end
end
