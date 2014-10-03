class GameController < ApplicationController

  def index
    @available_building_wings = BuildingWing.all
  end
end
