# == Schema Information
#
# Table name: magics
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :string(255)
#  classification :integer
#  damage         :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Magic < ActiveRecord::Base
  has_many :user_magics
  has_many :users, through: :user_magics
end
