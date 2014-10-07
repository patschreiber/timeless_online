class CreateUserStats < ActiveRecord::Migration
  def change
    create_table :user_stats do |t|
      t.integer :user_id
      t.integer :level
      t.integer :current_experience
      t.integer :total_experience
      t.integer :current_gold      
      t.integer :hp
      t.integer :mp
      t.integer :base_attack
      t.integer :base_defense
      t.integer :speed

      t.timestamps
    end
  end
end
