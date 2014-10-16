class ChangeEnemyBaseDamageToBaseAttack < ActiveRecord::Migration
  def change
    rename_column :enemies, :base_damage, :base_attack
  end
end
