class ChangeRoleColumnInUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :role
    add_column :users, :admin, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :users, :admin
    add_column :users, :role, :string
  end
end
