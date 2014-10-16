class BattleController < ApplicationController
  def index
    @user = User.find(current_user)
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

    next_level_exp = StatsService.determine_player_next_level_experience_requirement( @user.user_stat.level )
    updated_stats = StatsService.post_battle_update( @user, next_level_exp, @exp_to_add )

    data = { next_exp: next_level_exp, updated_stats: updated_stats }
    render :json => data
  end

end