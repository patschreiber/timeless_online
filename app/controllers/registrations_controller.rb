class RegistrationsController < Devise::RegistrationsController
  def create
    super 
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
