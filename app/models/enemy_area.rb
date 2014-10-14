# == Schema Information
#
# Table name: enemy_areas
#
#  id       :integer          not null, primary key
#  enemy_id :integer
#  area_id  :integer
#

class EnemyArea < ActiveRecord::Base
  belongs_to :enemy
  belongs_to :area
end
