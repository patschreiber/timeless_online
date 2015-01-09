# == Schema Information
#
# Table name: items
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :string(255)
#  classification     :integer
#  can_add_uniqueness :boolean
#  can_equip          :boolean
#  equip_slot         :integer
#  min_hp             :integer
#  max_hp             :integer
#  min_mp             :integer
#  max_mp             :integer
#  min_attack         :integer
#  max_attack         :integer
#  min_defense        :integer
#  max_defense        :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Item < ActiveRecord::Base
  belongs_to :user_inventory
end
