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

    item_found
  end

  def self.generate_uniqueness_or_save_item(current_user, item)

    # Generate a unique item or save regular item
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
    Rails.logger.debug item
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
      item_prefixes = ItemPrefix.all
      item_prefix = item_prefixes.sample
      new_item.prefix_name = item_prefix.name

      # HP
      unless item_prefix.min_hp_modifier.nil? || new_item.hp.nil?
        hp_mod = (item_prefix.min_hp_modifier..item_prefix.max_hp_modifier).to_a.sample
        new_item.hp = (new_item.hp + hp_mod >= 0) ? (new_item.hp + hp_mod) : new_item.hp = 0
      end

      # MP
      unless item_prefix.min_mp_modifier.nil? || new_item.mp.nil?
         mp_mod = (item_prefix.min_mp_modifier..item_prefix.max_mp_modifier).to_a.sample
        new_item.mp = (new_item.mp + mp_mod >= 0) ? (new_item.mp + mp_mod) : new_item.mp = 0
      end

      # Attack
      unless item_prefix.min_attack_modifier.nil? || new_item.attack.nil?
         attack_mod = (item_prefix.min_attack_modifier..item_prefix.max_attack_modifier).to_a.sample
        new_item.attack = (new_item.attack + attack_mod >= 0) ? (new_item.attack + attack_mod) : new_item.attack = 0
      end

      # Defense
      unless item_prefix.min_defense_modifier.nil? || new_item.defense.nil?
         defense_mod = (item_prefix.min_defense_modifier..item_prefix.max_defense_modifier).to_a.sample
        new_item.defense = (new_item.defense + defense_mod >= 0) ? (new_item.defense + defense_mod) : new_item.defense = 0
      end   
    end

    # Suffix
    if random_roll_suffix > suffix_threshold
      item_suffixes = ItemSuffix.all
      item_suffix = item_suffixes.sample
      new_item.suffix_name = item_suffix.name

      # HP
      unless item_suffix.min_hp_modifier.nil? || new_item.hp.nil?
        hp_mod = (item_suffix.min_hp_modifier..item_suffix.max_hp_modifier).to_a.sample
        new_item.hp = (new_item.hp + hp_mod >= 0) ? (new_item.hp + hp_mod) : new_item.hp = 0
      end

      # MP
      unless item_suffix.min_mp_modifier.nil? || new_item.mp.nil?
         mp_mod = (item_suffix.min_mp_modifier..item_suffix.max_mp_modifier).to_a.sample
        new_item.mp = (new_item.mp + mp_mod >= 0) ? (new_item.mp + mp_mod) : new_item.mp = 0
      end

      # Attack
      unless item_suffix.min_attack_modifier.nil? || new_item.attack.nil?
         attack_mod = (item_suffix.min_attack_modifier..item_suffix.max_attack_modifier).to_a.sample
        new_item.attack = (new_item.attack + attack_mod >= 0) ? (new_item.attack + attack_mod) : new_item.attack = 0
      end

      # Defense
      unless item_suffix.min_defense_modifier.nil? || new_item.defense.nil?
         defense_mod = (item_suffix.min_defense_modifier..item_suffix.max_defense_modifier).to_a.sample
        new_item.defense = (new_item.defense + defense_mod >= 0) ? (new_item.defense + defense_mod) : new_item.defense = 0
      end 
    end

    new_item
  end
end