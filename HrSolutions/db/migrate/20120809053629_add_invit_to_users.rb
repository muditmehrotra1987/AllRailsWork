class AddInvitToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invit_id, :integer
    add_column :users, :invit_limit, :integer
  end
end
