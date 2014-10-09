class CreateUserMagic < ActiveRecord::Migration
  def change
    create_table :user_magic do |t|
      t.integer :user_id
      t.integer :magic_id
    end
  end
end
