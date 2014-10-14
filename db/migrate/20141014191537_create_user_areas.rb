class CreateUserAreas < ActiveRecord::Migration
  def change
    create_table :user_areas do |t|
      t.integer :user_id
      t.integer :area_id
    end
  end
end
