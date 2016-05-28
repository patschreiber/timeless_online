class DropTableUserEquippedItems < ActiveRecord::Migration
  def change
    drop_table :user_equipped_items
  end
end
