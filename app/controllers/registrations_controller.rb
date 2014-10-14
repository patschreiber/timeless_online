class RegistrationsController < Devise::RegistrationsController
  def create
    super
    unless resource.admin?
      if resource.save
        @user_stats = UserStat.new(
          :id => resource.id,
          :user_id => resource.id,      
          :level => 1,
          :current_gold => 0,
          :hp => 100,
          :mp => 10,
          :base_attack => 3,
          :base_defense => 0,
          :speed => 50,
          :current_area => 1
        )
        @user_stats.save!

        @user_areas = UserArea.create(
          :user_id => resource.id,
          :area_id => 1
        )
      end
    end
  end

  
  protected


  def after_sign_up_path_for(resource)
    if resource.admin?
      root_path
    else
      game_path  
    end
  end
end
