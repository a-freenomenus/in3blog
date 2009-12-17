class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :users, :username
    add_index :comments, :post_id
    add_index :tags, :name
  end

  def self.down
    remove_index :tags, :column => :name
    remove_index :comments, :column => :post_id
    remove_index :users, :column => :username
  end
end
