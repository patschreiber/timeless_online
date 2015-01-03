class AddEquipSlotToGeneratedItems < ActiveRecord::Migration
  def change
    add_column :generated_items, :equip_slot, :integer, :after => :can_equip
  end
end
