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
  has_one :generated_item, 
  :primary_key => :unique_item_id, 
  :foreign_key => :unique_item_id
  has_one :item, :primary_key => :item_id, :foreign_key => :id

  def self.get_equipped_items
    return self.where(equipped: true)
  end

  def self.get_stats_from_equipped_items
    equipped_items = self.get_equipped_items

    @computed_stats = {
      'hp'      => 0,
      'mp'      => 0,
      'attack'  => 0,
      'defense' => 0
    }

    # Get all equipped item stat bonuses and add them together
    equipped_items.each do |user_inventory_item|
      Rails.logger.debug user_inventory_item.generated_item.inspect

      unless user_inventory_item.generated_item.hp.nil?
        @computed_stats['hp'] += user_inventory_item.generated_item.hp
      end

      unless user_inventory_item.generated_item.mp.nil?
        @computed_stats['mp'] += user_inventory_item.generated_item.mp
      end

      unless user_inventory_item.generated_item.attack.nil?
        @computed_stats['attack'] += user_inventory_item.generated_item.attack
      end

      unless user_inventory_item.generated_item.defense.nil?
        @computed_stats['defense'] += user_inventory_item.generated_item.defense
      end
    end

    @computed_stats
  end
end
