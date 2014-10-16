class StatsService
  def determine_player_next_level_experience_requirement( user )
    level = user.user_stat.level
    current_exp = user.user_stat.current_experience

    # Determine the exp requirement for the next level
    if level < 99
      next_level_exp = (Level.find_by level: level + 1).experience_required
    else
      next_level_exp = Level.find(99).experience_required
    end

    current_exp = current_exp + exp_to_add 

  end
end