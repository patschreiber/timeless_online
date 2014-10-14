# == Schema Information
#
# Table name: user_magics
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  magic_id :integer
#

class UserMagic < ActiveRecord::Base
  belongs_to :user
  belongs_to :magic
end
