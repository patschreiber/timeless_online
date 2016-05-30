# == Schema Information
#
# Table name: skills
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :string(255)
#  classification :integer
#  damage         :integer
#  ap             :integer
#  created_at     :datetime
#  updated_at     :datetime
#



class Skill < ActiveRecord::Base
  has_one :user_skills
end
