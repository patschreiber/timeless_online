# == Schema Information
#
# Table name: areas
#
#  id   :integer          not null, primary key
#  name :string(255)
#


class Area < ActiveRecord::Base
  has_many :user_areas
  has_many :users, through: :user_areas
  has_many :enemy_areas
  has_many :enemies, through: :enemy_areas
end
