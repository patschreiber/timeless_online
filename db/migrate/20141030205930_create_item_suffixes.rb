class CreateItemSuffixes < ActiveRecord::Migration
  def change
    create_table :item_suffixes do |t|
      t.string :name
      t.integer :min_hp_modifier
      t.integer :max_hp_modifier
      t.integer :min_mp_modifier
      t.integer :max_mp_modifier
      t.integer :min_attack_modifier
      t.integer :max_attack_modifier
      t.integer :min_defense_modifier
      t.integer :max_defense_modifier
      t.float :min_speed_modifier
      t.float :max_speed_modifier
    end
  end
end
