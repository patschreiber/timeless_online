# == Schema Information
#
# Table name: levels
#
#  id                  :integer          not null, primary key
#  level               :integer
#  experience_required :integer
#

class Level < ActiveRecord::Base

  def self.determine_player_next_level_experience_requirement( level )

    # Determine the exp requirement for the next level
    if level < 99
      next_level_exp = (Level.find_by level: level + 1).experience_required
    else
      next_level_exp = Level.find(99).experience_required
    end

    next_level_exp
  end

  def self.determine_percent_to_next_level(current_exp, next_level_exp)
    return (current_exp.to_f / next_level_exp.to_f * 100).round(1)
  end
end
