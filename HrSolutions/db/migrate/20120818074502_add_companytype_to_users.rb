class AddCompanytypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :companytype, :string
  end
end
