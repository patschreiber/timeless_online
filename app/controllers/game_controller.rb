class GameController < ApplicationController

  def index
    @areas = Area.all
    
    @user_areas = []
    current_user.areas.each do |user_area|
      @user_areas.push(user_area.id)
    end
  end

  def inventory
    @user = User.find(current_user)
    @user_inventories_consumables = @user.user_inventories.where(unique_item_id: nil)
    @user_inventories_equippables = @user.user_inventories.where.not(unique_item_id: nil)

    # For each user inventory, determine if consumable item or equippable, then separate the two
  end

  def update_area
    
  end
end
