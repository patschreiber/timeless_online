class CreateEnemies < ActiveRecord::Migration
  def change
    create_table :enemies do |t|
      t.string :name
      t.string :description
      t.integer :classification
      t.integer :level
      t.integer :base_damage
      t.integer :base_defense

      t.timestamps
    end
  end
end
