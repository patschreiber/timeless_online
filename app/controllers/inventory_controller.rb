class InventoryController < ApplicationController

  def index
  end

  def show
    @user = User.find(current_user)
    @user_inventories_consumables = @user.user_inventories.where(unique_item_id: nil)
    @user_inventories_equippables = @user.user_inventories.where.not(unique_item_id: nil)

    # For each user inventory, determine if consumable item or equippable, then separate the two
  end
end