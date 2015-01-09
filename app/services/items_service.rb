class ItemsService

  # Determine which loot table to pull an item from and find base item
  # returns item_found, base item to add uniqueness to
  def self.generate_item_from_enemy(enemy)
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

    item_found
  end


  # Adds a new entry into a user's inventory or increments the quantity available in the user's 
  # inventory if there is already one or more available of the item being added.
  # Generate a unique item or save regular item
  # returns item, saved item object
  def self.save_item_to_inventory(current_user, item)

    if ( item.can_add_uniqueness == true )
      new_item = self.add_uniqueness(item)
      new_item.save!

      user_inventory = UserInventory.new
      user_inventory.user_id = current_user.id
      user_inventory.unique_item_id = new_item.unique_item_id
      user_inventory.item_id = item.id
      user_inventory.quantity = 1
      user_inventory.save!

      # Implicit return
      new_item
    else 
      # See if an item is currently in the user inventory
      item_in_inventory = current_user.user_inventories.find_by_item_id(item.id)

      if item_in_inventory.nil?
        user_inventory = UserInventory.new
        user_inventory.user_id = current_user.id
        user_inventory.item_id = item.id
        user_inventory.quantity = 1
        user_inventory.save!
      else
        item_in_inventory.quantity = item_in_inventory.quantity + 1
        item_in_inventory.save!
      end

      # Implicit return
      item
    end
  end


  # Computes a stat value for the newly generated item. Determines if there should be a prefix or suffix  
  # added to the item. 
  # returns new_item, GeneratedItem object
  def self.add_uniqueness(item)
    # See if we're even going to add a random affix/suffix
    random_roll_prefix = Random.rand(0..10)
    random_roll_suffix = Random.rand(0..10)

    # Any roll below these numbers doesnt add a prefix or suffix
    prefix_threshold = 5
    suffix_threshold = 5

    new_item = GeneratedItem.new
    new_item.item_id = item.id
    new_item.name = item.name
    new_item.description = item.description
    new_item.can_equip = 1
    new_item.equip_slot = item.equip_slot

    unless item.can_equip.nil?
      new_item.can_equip = true
    end

    # Compute item stat values from min and max
    unless item.min_hp.nil?
      new_item.hp = (item.min_hp..item.max_hp).to_a.sample
    end

    unless item.min_mp.nil?
      new_item.mp = (item.min_mp..item.max_mp).to_a.sample
    end

    unless item.min_attack.nil?
      new_item.attack = (item.min_attack..item.max_attack).to_a.sample
    end

    unless item.min_defense.nil?
      new_item.defense = (item.min_defense..item.max_defense).to_a.sample
    end

    # Now add any stat buffs/debuffs from affixes, stats cannot go in the negative
    # Prefix
    if random_roll_prefix > prefix_threshold
      add_prefix_or_suffix_effects(new_item, 'prefix')
    end

    # Suffix
    if random_roll_suffix > suffix_threshold
      add_prefix_or_suffix_effects(new_item, 'suffix')
    end

    # Implicit return
    new_item
  end


  # Takes the item being generated and a designation of 'prefix' or 'suffix' and generates random
  # values based on the prefix or suffix values defined in item_prefixes or item_suffixes table.
  # returns item
  def self.add_prefix_or_suffix_effects(item, designation)
    if designation == 'prefix'
      prefixes = ItemPrefix.all
      modifier = prefixes.sample
      item.prefix_name = modifier.name
    elsif designation == 'suffix'
      suffixes = ItemSuffix.all
      modifier = suffixes.sample
      item.suffix_name = modifier.name
    else
      raise "designation must be prefix or suffix"
    end

    # HP
    unless modifier.min_hp_modifier.nil? || item.hp.nil?
      hp_mod = (modifier.min_hp_modifier..modifier.max_hp_modifier).to_a.sample
      item.hp = (item.hp + hp_mod >= 0) ? (item.hp + hp_mod) : item.hp = 0
    end

    # MP
    unless modifier.min_mp_modifier.nil? || item.mp.nil?
       mp_mod = (modifier.min_mp_modifier..modifier.max_mp_modifier).to_a.sample
      item.mp = (item.mp + mp_mod >= 0) ? (item.mp + mp_mod) : item.mp = 0
    end

    # Attack
    unless modifier.min_attack_modifier.nil? || item.attack.nil?
       attack_mod = (modifier.min_attack_modifier..modifier.max_attack_modifier).to_a.sample
      item.attack = (item.attack + attack_mod >= 0) ? (item.attack + attack_mod) : item.attack = 0
    end

    # Defense
    unless modifier.min_defense_modifier.nil? || item.defense.nil?
       defense_mod = (modifier.min_defense_modifier..modifier.max_defense_modifier).to_a.sample
      item.defense = (item.defense + defense_mod >= 0) ? (item.defense + defense_mod) : item.defense = 0
    end 

    # Implicit return
    item
  end
end