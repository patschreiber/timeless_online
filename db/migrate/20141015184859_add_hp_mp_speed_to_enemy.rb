class AddHpMpSpeedToEnemy < ActiveRecord::Migration
  def change
    add_column :enemies, :hp, :integer, :after => :level
    add_column :enemies, :mp, :integer, :after => :hp
    add_column :enemies, :speed, :integer, :after => :base_defense
  end
end
