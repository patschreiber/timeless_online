class CreateUserMagic < ActiveRecord::Migration
  def change
    create_table :user_magics do |t|
      t.integer :user_id
      t.integer :magic_id
    end
  end
end
