# == Schema Information
#
# Table name: enemies
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :string(255)
#  classification :integer
#  level          :integer
#  base_damage    :integer
#  base_defense   :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Enemy < ActiveRecord::Base
  has_many :enemy_areas
  has_many :areas, through: :enemy_areas
end
