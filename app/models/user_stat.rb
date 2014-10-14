# == Schema Information
#
# Table name: user_stats
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  level              :integer
#  current_experience :integer
#  total_experience   :integer
#  current_gold       :integer
#  hp                 :integer
#  mp                 :integer
#  base_attack        :integer
#  base_defense       :integer
#  speed              :integer
#  created_at         :datetime
#  updated_at         :datetime
#


class UserStat < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
end
