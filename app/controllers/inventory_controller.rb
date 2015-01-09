class InventoryController < ApplicationController

  def index
  end

  def show
    # For each user inventory, determine if consumable item or equippable, then separate the two
    @user = current_user
    @user_inventories_consumables = @user.user_inventories.where(unique_item_id: nil)
    @user_inventories_equippables = @user.user_inventories.where.not(unique_item_id: nil)
  end

  def equip_or_unequip_item
    @user = current_user
    item_to_equip_id = params['item_to_modify']

    #unequip_item, true = ok to unequip item, false = do not unequip item
    unequip_item = params['unequip_item']   
    data = {}

    # Get the generated unique item id in order to see if the item is equippable or not
    @item_to_equip_in_inventory = @user.user_inventories.find_by_unique_item_id(item_to_equip_id)
    base_item = GeneratedItem.find_by_unique_item_id(@item_to_equip_in_inventory.unique_item_id)
    can_equip = base_item.can_equip
    equip_slot = base_item.equip_slot

    # Only equip the item if the item has the capacity to be equipped
    if can_equip && equip_slot != nil
      @user_equipped_item_slot = UserEquippedItem.find_by_user_id_and_equip_slot(@user.id, equip_slot)

      # Check if item in slot is already equipped with a different item and unequip if necessary
      # There is already another item equipped
      if @user_equipped_item_slot.unique_item_id.present?
        # Set 'equipped' to null in user_inventories
        @user_inventory_unequip = @user.user_inventories.find_by_unique_item_id(@user_equipped_item_slot.unique_item_id)
        @user_inventory_unequip.equipped = nil
        @user_inventory_unequip.save!
        # We're only going to return the unique_item_id because we only need to unequip the item.
        # There is no need to send a whole item object back for the unequip
        data['unequipped_item'] = @user_equipped_item_slot.unique_item_id
      end
      
      # Equip or unequip item
      if unequip_item == 'true'
        @user_equipped_item_slot.unique_item_id = nil
        @item_to_equip_in_inventory.equipped = nil
      else 
        @user_equipped_item_slot.unique_item_id = item_to_equip_id
        @item_to_equip_in_inventory.equipped = 1
      end

      @item_to_equip_in_inventory.save!
      @user_equipped_item_slot.save!
    end

    data['equipped_item'] = base_item
    render :json => data
  end
end