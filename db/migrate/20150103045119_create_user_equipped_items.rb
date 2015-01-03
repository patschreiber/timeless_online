class CreateUserEquippedItems < ActiveRecord::Migration
  def change
    create_table :user_equipped_items do |t|
      t.integer :user_id
      t.integer :equip_slot
      t.string :unique_item_id
    end
  end
end
