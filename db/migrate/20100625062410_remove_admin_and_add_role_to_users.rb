class RemoveAdminAndAddRoleToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :admin
    add_column :users, :role, :string
  end

  def self.down
    remove_column :users, :role
    add_column :users, :admin, :null => false, :default => false
  end
end
