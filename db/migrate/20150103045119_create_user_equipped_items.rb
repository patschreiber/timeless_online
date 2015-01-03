class CreateUserEquippedItems < ActiveRecord::Migration
  def change
    create_table :user_equipped_items do |t|
      t.integer :user_id
      t.string :unique_item_id
      t.integer :equip_slot
    end
  end
end
