# == Schema Information
#
# Table name: user_inventories
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  item_id        :integer
#  unique_item_id :string(255)
#  quantity       :integer
#  equipped       :boolean
#  position       :integer
#



class UserInventory < ActiveRecord::Base
  belongs_to :user
  has_one :generated_item, :primary_key => :unique_item_id, :foreign_key => :unique_item_id
  has_one :item, :primary_key => :item_id, :foreign_key => :id
end
