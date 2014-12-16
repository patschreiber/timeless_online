class CreateEquipSlots < ActiveRecord::Migration
  def change
    create_table :equip_slots do |t|
      t.string :name
      t.timestamps
    end
  end
end
