class AddPostIdToAudios < ActiveRecord::Migration
  def self.up
    add_column :audios, :post_id, :integer
  end

  def self.down
    remove_column :audios, :post_id
  end
end
