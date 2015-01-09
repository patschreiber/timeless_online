# == Schema Information
#
# Table name: enemy_loot_tables
#
#  id       :integer          not null, primary key
#  enemy_id :integer
#  rarity   :integer
#  item_id  :integer
#

class EnemyLootTable < ActiveRecord::Base
  belongs_to :enemy
end
