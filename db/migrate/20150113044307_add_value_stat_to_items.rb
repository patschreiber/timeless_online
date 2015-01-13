class AddValueStatToItems < ActiveRecord::Migration
  def change
    add_column :items, :value, :integer, :after => :max_defense
    add_column :generated_items, :value, :integer, :after => :defense
    add_column :item_prefixes, :min_value_modifier, :integer, :after => :max_speed_modifier
    add_column :item_prefixes, :max_value_modifier, :integer, :after => :min_value_modifier
    add_column :item_suffixes, :min_value_modifier, :integer, :after => :max_speed_modifier
    add_column :item_suffixes, :max_value_modifier, :integer, :after => :min_value_modifier    
  end
end
