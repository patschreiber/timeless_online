class BattleController < ApplicationController
  def index
    @user = User.find(current_user)
    @next_level_experience = Level.determine_player_next_level_experience_requirement( @user.user_stat.level )
    @percent_to_level = Level.determine_percent_to_next_level( @user.user_stat.current_experience, @next_level_experience )
    enemies_in_area = EnemyArea.where(:area_id => @user.user_stat.current_area)
    enemy_sample = enemies_in_area.sample
    @enemy = enemy_sample.enemy
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

  def update_stats
    @user = User.find(current_user)
    @exp_to_add = Enemy.find(params[:enemy_id]).experience

    options = {
      :params => params,
      :exp_to_add => @exp_to_add
    }

    @next_level_exp = Level.determine_player_next_level_experience_requirement( @user.user_stat.level )
    
    # Updates the user_stats
    StatsService.post_battle_update( @user, @next_level_exp, options )

    data = { next_exp: @next_level_exp, player: @user.user_stat, exp_to_add: @exp_to_add }
    render :json => data
  end

end