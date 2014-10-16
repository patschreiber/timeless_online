class AddTotalWinsAndTotalLossesToUserStats < ActiveRecord::Migration
  def change
    add_column :user_stats, :total_wins, :integer, :after => :current_area
    add_column :user_stats, :total_losses, :integer, :after => :total_wins
  end
end
