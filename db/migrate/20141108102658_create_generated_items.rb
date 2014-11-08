class CreateGeneratedItems < ActiveRecord::Migration
  def change
    create_table :generated_items do |t|
      t.integer :base_item_id
      t.string :unique_item_id
      t.string :prefix_name
      t.string :name
      t.string :suffix_name
      t.string :description
      t.integer :classification
      t.boolean :can_equip
      t.integer :hp
      t.integer :mp
      t.integer :attack
      t.integer :defense
      t.timestamps
    end

    add_index :generated_items, :base_item_id
    add_index :generated_items, :unique_item_id, :unique => true
  end
end
