# == Schema Information
#
# Table name: user_equipped_items
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  equip_slot     :integer
#  unique_item_id :string(255)
#

class UserEquippedItem < ActiveRecord::Base
  belongs_to :user
  has_many :generated_item, :primary_key => :unique_item_id, :foreign_key => :unique_item_id
end
