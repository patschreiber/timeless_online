class AddEquippedToUserInventories < ActiveRecord::Migration
  def change
    add_column :user_inventories, :equipped, :boolean, :after => :quantity
  end
end
