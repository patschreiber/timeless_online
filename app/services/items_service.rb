class ItemsService

  def generate_item
  end

  def generate_item_from_enemy
    # Determine which loot table to pull an item from and find base item
    random = Random.rand(0..10)
   
    case random
    when random < 7
      enemy_item_found = @enemy.enemy_loot_tables.where(:rarity => 1).sample
      item_found = Item.find(enemy_item_found.item_id)
    when random >= 7 && random <= 9
      enemy_item_found = @enemy.enemy_loot_tables.where(:rarity => 2).sample
      item_found = Item.find(enemy_item_found.item_id)
    when random == 10
      enemy_item_found = @enemy.enemy_loot_tables.where(:rarity => 3).sample
      item_found = Item.find(enemy_item_found.item_id)
    end
      
    # Generate a unique item
    if ( item_found.can_add_uniqueness == true )
      self.add_uniqueness(item_found)
    end

  end

  def add_uniqueness(item)
  end
end