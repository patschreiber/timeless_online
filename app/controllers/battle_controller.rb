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

  def post_battle_update
    @user = User.find(current_user)
    @enemy = Enemy.find(params[:enemy_id])
    @exp_to_add = Enemy.find(params[:enemy_id]).experience
    @next_level_exp = Level.determine_player_next_level_experience_requirement( @user.user_stat.level )

    # Rewards are split into two types: Numerical gains e.g. exp, ap, gold, etc. and Item gains, which are item objects
    rewards = {}
    rewards['items'] = []
    rewards['numericalGains'] = {}

    options = {
      :params => params,
      :exp_to_add => @exp_to_add
    }
    
    # Updates the user_stats
    StatsService.post_battle_update( @user, @next_level_exp, options )

    # Get items from the enemy, if any
    if @enemy.enemy_loot_tables.exists?
      item_from_enemy = ItemsService.generate_item_from_enemy( @enemy )
      reward_item = ItemsService.generate_uniqueness_or_save_item( current_user, item_from_enemy )

      # Adds multiple items to the reward hash if multiple items were earned
      rewards['items'].push(reward_item)
    end

    # Add rewards for battle if there are any
    rewards['numericalGains']['EXP'] = @exp_to_add

    if @enemy.ap != nil
      rewards['numericalGains']['AP'] = @enemy.ap
    end

    data = { next_exp: @next_level_exp, player: @user.user_stat, exp_to_add: @exp_to_add, rewards: rewards }
    render :json => data
  end

  def enemy_action
    @enemy = Enemy.find(params[:enemy_id])

    # Make regular attacks more common
    if @enemy.skills.length > 0 
      random = Random.rand(0..10)
      if random < 7
        @attack = @enemy.base_attack
        @basic_attack = true
      else
        @attack = @enemy.skills.sample
        @basic_attack = false
      end
    else
      @attack = @enemy.base_attack
      @basic_attack = true
    end

    data = { enemy: @enemy, attack: @attack, basic_attack: @basic_attack }
    render :json => data
  end
end