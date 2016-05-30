class AddLearnedAndCurrentApToUserSkills < ActiveRecord::Migration
  def change
    add_column :user_skills, :current_ap, :integer, :after => :skill_id
    add_column :user_skills, :learned, :boolean, :after=> :current_ap
  end
end
