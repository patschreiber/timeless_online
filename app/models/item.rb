class Item < ActiveRecord::Base
  belongs_to :user_inventory, :primary_key => :base_item_id, :foreign_key => :id
end