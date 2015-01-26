class AddComputedStatsToUserStats < ActiveRecord::Migration
  def change
    add_column :user_stats, :computed_hp, :integer, :after => :hp
    add_column :user_stats, :computed_mp, :integer, :after => :mp
    add_column :user_stats, :computed_attack, :integer, :after => :base_attack
    add_column :user_stats, :computed_defense, :integer, :after => :base_defense
    add_column :user_stats, :computed_speed, :integer, :after => :speed 
  end
end
