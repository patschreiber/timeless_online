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
          :current_experience => 0,
          :total_experience => 0,
          :hp => 100,
          :mp => 10,
          :base_attack => 3,
          :base_defense => 0,
          :speed => 50,
          :current_area => 1,
          :total_wins => 0,
          :total_losses => 0
        )
        @user_stats.save!

        @user_areas = UserArea.create(
          :user_id => resource.id,
          :area_id => 1
        )

        #Create all equippable item slots for user
        @equip_slots = EquipSlot.all
        @equip_slots.each do |slot|
          @user_equipped_item = UserEquippedItem.create(
            :user_id => resource.id,
            :equip_slot => slot.id
          )
        end
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
