# == Schema Information
#
# Table name: generated_items
#
#  id             :integer          not null, primary key
#  item_id        :integer
#  unique_item_id :string(255)
#  prefix_name    :string(255)
#  name           :string(255)
#  suffix_name    :string(255)
#  description    :string(255)
#  classification :integer
#  can_equip      :boolean
#  equip_slot     :integer
#  hp             :integer
#  mp             :integer
#  attack         :integer
#  defense        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class GeneratedItem < ActiveRecord::Base
  before_create :generate_unique_item_id

  belongs_to :user_inventory, :primary_key => :unique_item_id, :foreign_key => :unique_item_id

  protected

  def generate_unique_item_id
    self.unique_item_id = loop do
      unique_id_string = Digest::SHA1.hexdigest([Time.now, rand].join)
      break unique_id_string unless GeneratedItem.exists?(unique_item_id: unique_id_string)
    end
  end
end
