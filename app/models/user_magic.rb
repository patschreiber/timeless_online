class UserMagic < ActiveRecord::Base
  belongs_to :user
  belongs_to :magic
end