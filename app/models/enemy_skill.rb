# == Schema Information
#
# Table name: enemy_skills
#
#  id       :integer          not null, primary key
#  enemy_id :integer
#  skill_id :integer
#

class EnemySkill < ActiveRecord::Base
  belongs_to :enemy
  belongs_to :skill
end
