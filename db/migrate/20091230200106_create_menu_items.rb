class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.string :name
      t.string :url
      t.integer :position
      t.boolean :visible, :default => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :menu_items
  end
end
