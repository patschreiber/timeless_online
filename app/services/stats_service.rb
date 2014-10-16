class StatsService
  def self.determine_player_next_level_experience_requirement( level )

    # Determine the exp requirement for the next level
    if level < 99
      next_level_exp = (Level.find_by level: level + 1).experience_required
    else
      next_level_exp = Level.find(99).experience_required
    end

    next_level_exp
  end

  def self.post_battle_update( user, next_level_exp, exp_to_add )
    current_exp = user.user_stat.current_experience
    level = user.user_stat.level

    current_exp = current_exp + exp_to_add

    if level < 98
      if current_exp >= next_level_exp
        next_level_exp = self.determine_player_next_level_experience_requirement( level )
        remainder = current_exp - next_level_exp
        current_exp = 0 + remainder
        level = level + 1
      else
        next_level_exp = self.determine_player_next_level_experience_requirement( level )
      end

    elsif level === 98
      if current_exp >= next_level_exp
        level = level + 1
        current_exp = 0
      else
        next_level_exp = self.determine_player_next_level_experience_requirement( level )
      end
    end

    user.user_stat.level = level
    user.user_stat.current_experience = current_exp
    user.user_stat.total_experience = user.user_stat.total_experience + exp_to_add
    user.user_stat.save!
  end

end