class InventoryController < ApplicationController

  def index
  end

  def show
    @user = current_user
    @user_inventories_consumables = @user.user_inventories.where(unique_item_id: nil)
    @user_inventories_equippables = @user.user_inventories.where.not(unique_item_id: nil)

    # For each user inventory, determine if consumable item or equippable, then separate the two
  end

  def equip_item
    @user = current_user
    item_to_equip_id = params['item_to_equip']

    # Get the base item id in order to see if the item is equippable or not
    @item_to_equip = @user.user_inventories.find_by_unique_item_id(item_to_equip_id)
    base_item = GeneratedItem.find_by_item_id(@item_to_equip.item_id)
    can_equip = base_item.can_equip
    equip_slot = base_item.equip_slot

    if can_equip && equip_slot != nil
      #Check if item in slot is already equipped and unequip if necessary
      #Equip new item
      Rails.logger.debug can_equip
      Rails.logger.debug equip_slot
    end

    data = @item_to_equip
    render :json => data
  end
end