class AddExpToEnemies < ActiveRecord::Migration
  def change
    add_column :enemies, :experience, :integer, :after => :level
  end
end
