class CreateEnemyLootTables < ActiveRecord::Migration
  def change
    create_table :enemy_loot_tables do |t|
      t.integer :enemy_id
      t.integer :rarity
      t.integer :item_id
    end
  end
end
