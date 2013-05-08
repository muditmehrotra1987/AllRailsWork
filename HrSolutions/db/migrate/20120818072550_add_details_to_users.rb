class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :phonenumber, :string
    add_column :users, :registrationid, :string
    add_column :users, :type, :string
  end
end
