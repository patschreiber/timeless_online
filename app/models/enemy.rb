# == Schema Information
#
# Table name: enemies
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :string(255)
#  classification :integer
#  level          :integer
#  experience     :integer
#  ap             :integer
#  hp             :integer
#  mp             :integer
#  base_attack    :integer
#  base_defense   :integer
#  speed          :integer
#  created_at     :datetime
#  updated_at     :datetime
#


class Enemy < ActiveRecord::Base
  has_many :enemy_areas
  has_many :areas, through: :enemy_areas
  has_many :enemy_skills
  has_many :skills, through: :enemy_skills
  has_many :enemy_loot_tables
end
