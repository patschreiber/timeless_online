class PlayerController < ApplicationController
  def show
    current_experience = current_user.user_stat.current_experience
    current_level = current_user.user_stat.level
    next_level_total_exp = Level.determine_player_next_level_experience_requirement(current_level)

    @stats_from_items = current_user
      .user_inventories
      .get_stats_from_equipped_items
    @exp_left = next_level_total_exp - current_experience
    @percent_to_level = Level.determine_percent_to_next_level(current_experience, next_level_total_exp)
    @computed_stats = current_user.get_computed_stats
  end
end