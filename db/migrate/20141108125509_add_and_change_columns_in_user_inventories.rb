class AddAndChangeColumnsInUserInventories < ActiveRecord::Migration
  def change
    rename_column :user_inventories, :item_id, :base_item_id
    change_column :user_inventories, :base_item_id, :integer
    add_column :user_inventories, :unique_item_id, :string, :after => :base_item_id
    add_column :user_inventories, :user_id, :integer, :after => :id
    add_column :user_inventories, :position, :integer, :after => :quantity
  end
end
