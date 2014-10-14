# == Schema Information
#
# Table name: user_areas
#
#  id      :integer          not null, primary key
#  user_id :integer
#  area_id :integer
#

class UserArea < ActiveRecord::Base
  belongs_to :user
  belongs_to :area
end
