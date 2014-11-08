class ItemsService

  def generate_item
  end

  def self.generate_item_from_enemy(enemy)
    # Determine which loot table to pull an item from and find base item
    random = Random.rand(0..10)
    common_item_threshold = 7
    uncommon_item_threshold = 9
    rare_item_threshold = 10
   

    if random < common_item_threshold
      enemy_item_found = enemy.enemy_loot_tables.where(:rarity => 1).sample
      item_found = Item.find_by_id(enemy_item_found.item_id)
    elsif random >= common_item_threshold && random <= uncommon_item_threshold
      enemy_item_found = enemy.enemy_loot_tables.where(:rarity => 2).sample
      item_found = Item.find_by_id(enemy_item_found.item_id)
    elsif random == rare_item_threshold
      enemy_item_found = enemy.enemy_loot_tables.where(:rarity => 3).sample
      item_found = Item.find_by_id(enemy_item_found.item_id)
    end

    Rails.logger.debug item_found
      
    # Generate a unique item
    if ( item_found.can_add_uniqueness == true )
      self.add_uniqueness(item_found)
    else 
      return item_found
    end

  end

  def self.add_uniqueness(item)
    # See if we're even going to add a random affix/suffix
    random_roll_prefix = Random.rand(0..10)
    random_roll_suffix = Random.rand(0..10)

    if random_roll_prefix > 5
      item_prefixes = ItemPrefix.all
      item_prefix = item_prefixes.sample
    end

    if random_roll_suffix > 5
      item_suffixes = ItemSuffix.all
      item_suffix = item_suffixes.sample
    end

  end
end