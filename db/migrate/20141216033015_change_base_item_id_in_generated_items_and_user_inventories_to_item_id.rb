class ChangeBaseItemIdInGeneratedItemsAndUserInventoriesToItemId < ActiveRecord::Migration
  def change
    rename_column :generated_items, :base_item_id, :item_id
    rename_column :user_inventories, :base_item_id, :item_id
  end
end
