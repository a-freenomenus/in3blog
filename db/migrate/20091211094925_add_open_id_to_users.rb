class AddOpenIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :open_id, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :users, :open_id
  end
end
