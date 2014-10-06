class CreateBuildingWings < ActiveRecord::Migration
  def change
    create_table :building_wings do |t|
      t.string :name
      t.integer :cost
      t.string :flavor_text
    end
  end
end
