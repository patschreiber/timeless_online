class BattleController < ApplicationController
  def index
    @user = User.find(current_user)
    @player_current_area = @user.user_stat.current_area
  end

  def battle_action
    # Request data
    # 1 - Attack
    # 2 - Skills
    # 3 - Magic
    # 4 - Items

    @user = User.find(current_user)

    respond_to do |format|
      data = { player: @user.user_stat }
      format.json { render :json => data, :status => :ok }
    end
  end

end