class AddCurrentAreaToUserStats < ActiveRecord::Migration
  def change
    add_column :user_stats, :current_area, :string, :after => :speed
  end
end
