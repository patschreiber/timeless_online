class GameController < ApplicationController

  def index
    @areas = Area.all
    
    @user_areas = []
    current_user.areas.each do |user_area|
      @user_areas.push(user_area.id)
    end
  end

  def inventory
  end

  def update_area
    
  end
end
