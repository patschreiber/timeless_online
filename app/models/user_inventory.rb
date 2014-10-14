# == Schema Information
#
# Table name: user_inventories
#
#  id       :integer          not null, primary key
#  item_id  :integer
#  quantity :integer
#


class UserInventory < ActiveRecord::Base
  belongs_to :user
end
