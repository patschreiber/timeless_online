class AddFirstnameAndLastnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string, :after => :email
    add_column :users, :first_name, :string, :after => :last_name
  end
end
