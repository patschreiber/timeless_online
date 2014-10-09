class Magic < ActiveRecord::Base
  has_many :user_magics
  has_many :users, through: :user_magics
end