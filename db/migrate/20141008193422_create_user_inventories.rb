class CreateUserInventories < ActiveRecord::Migration
  def change
    create_table :user_inventories do |t|
      t.integer :item_id, :limit => 8
      t.integer :quantity
    end
  end
end
