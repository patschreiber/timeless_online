class CreateEnemyAreas < ActiveRecord::Migration
  def change
    create_table :enemy_areas do |t|
      t.integer :enemy_id
      t.integer :area_id
    end
  end
end
