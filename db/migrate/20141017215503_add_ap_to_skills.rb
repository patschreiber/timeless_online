class AddApToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :ap, :integer, :after => :damage
  end
end
