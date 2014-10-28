class CreateEnemyLootTables < ActiveRecord::Migration
  def change
    create_table :enemy_loot_tables do |t|
      t.integer :rarity
      t.integer :item_id
    end
  end
end
