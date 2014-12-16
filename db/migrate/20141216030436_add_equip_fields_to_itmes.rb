class AddEquipFieldsToItmes < ActiveRecord::Migration
  def change
    add_column :items, :can_equip, :boolean, :after => :can_add_uniqueness
    add_column :items, :equip_slot, :integer, :after => :can_equip
  end
end
