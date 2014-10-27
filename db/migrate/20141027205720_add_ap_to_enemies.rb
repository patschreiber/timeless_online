class AddApToEnemies < ActiveRecord::Migration
  def change
    add_column :enemies, :ap, :integer, :after => :experience
  end
end
