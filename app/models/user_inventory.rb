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
  has_one :generated_item, :primary_key => :unique_item_id, :foreign_key => :unique_item_id
  has_one :item, :primary_key => :base_item_id, :foreign_key => :id
end
