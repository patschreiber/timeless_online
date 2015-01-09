# == Schema Information
#
# Table name: item_prefixes
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  min_hp_modifier      :integer
#  max_hp_modifier      :integer
#  min_mp_modifier      :integer
#  max_mp_modifier      :integer
#  min_attack_modifier  :integer
#  max_attack_modifier  :integer
#  min_defense_modifier :integer
#  max_defense_modifier :integer
#  min_speed_modifier   :float
#  max_speed_modifier   :float
#

class ItemPrefix < ActiveRecord::Base
end
