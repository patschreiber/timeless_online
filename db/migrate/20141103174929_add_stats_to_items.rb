class AddStatsToItems < ActiveRecord::Migration
  def change
    add_column :items, :min_hp, :integer, :after => :can_add_uniqueness
    add_column :items, :max_hp, :integer, :after => :min_hp
    add_column :items, :min_mp, :integer, :after => :max_hp
    add_column :items, :max_mp, :integer, :after => :min_mp
    add_column :items, :min_attack, :integer, :after => :max_mp
    add_column :items, :max_attack, :integer, :after => :min_attack
    add_column :items, :min_defense, :integer, :after => :max_attack
    add_column :items, :max_defense, :integer, :after => :min_defense
  end
end
