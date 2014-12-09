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
    @user_inventories = @user.user_inventories
    @user_inventory_item_names = @user.user_inventories.generated_items

    # For each user inventory, determine if consumable item or equippable, then separate the two
  end

  def update_area
    
  end
end
