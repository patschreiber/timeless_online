class AddCanBeEditedToItems < ActiveRecord::Migration
  def change
    add_column :items, :can_add_uniqueness, :boolean, :after => :classification
  end
end
