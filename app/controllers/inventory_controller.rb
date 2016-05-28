class InventoryController < ApplicationController

  def index
  end

  def show
    # For each user inventory, determine if consumable item or equippable, then separate the two
    @user = current_user
    @user_inventories_consumables = []
    @user_inventories_equippables = []

    @user.user_inventories.each do |inventory_item|
      if inventory_item.item.can_equip 
        @user_inventories_equippables.push(inventory_item)
      else
        @user_inventories_consumables.push(inventory_item)
      end
    end
  end

  def equip
    item_to_equip = current_user.user_inventories.find_by_unique_item_id(params['unique_item_id'])
    currently_equipped_items = current_user.user_inventories.where(:equipped => 1)
    Rails.logger.debug currently_equipped_items.inspect

    # Check if item in slot is already equipped with a different item and unequip if necessary
    if currently_equipped_items != nil
      currently_equipped_items.each do |equipped_item|
        if equipped_item.item.equip_slot == item_to_equip.item.equip_slot
          equipped_item.equipped = false
          equipped_item.save!
        end
      end
    end

    item_to_equip.equipped = true
    item_to_equip.save!

    redirect_to inventory_path
  end

  def unequip
    item_to_unequip = current_user.user_inventories.find_by_unique_item_id(params['unique_item_id'])
    item_to_unequip.equipped = false
    item_to_unequip.save!

    redirect_to inventory_path
  end
end