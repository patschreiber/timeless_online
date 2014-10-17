class StatsService

  def self.post_battle_update( user, next_level_exp, opts = {} )
    exp_to_add = opts[:exp_to_add]
    battle_outcome = opts[:params][:battle_outcome]

    current_exp = user.user_stat.current_experience
    level = user.user_stat.level

    current_exp = current_exp + exp_to_add

    if level < 98
      if current_exp >= next_level_exp
        next_level_exp = Level.determine_player_next_level_experience_requirement( level )
        remainder = current_exp - next_level_exp
        current_exp = 0 + remainder
        level = level + 1
      else
        next_level_exp = Level.determine_player_next_level_experience_requirement( level )
      end

    elsif level === 98
      if current_exp >= next_level_exp
        level = level + 1
        current_exp = 0
      else
        next_level_exp = Level.determine_player_next_level_experience_requirement( level )
      end
    end

    if battle_outcome.present?
      if battle_outcome
        user.user_stat.total_wins = user.user_stat.total_wins + 1 
      else
        user.user_stat.total_losses = user.user_stat.total_losses + 1
      end
    end

    user.user_stat.update_attributes( level: level, current_experience: current_exp, total_experience: (user.user_stat.total_experience + exp_to_add) )
    user.user_stat.save!
  end
end