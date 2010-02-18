class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :url
      t.string :name
      t.boolean :visible, :null => false, :default => false
      t.integer :position, :null => false, :default => 0
      t.string :target
      t.timestamps
    end
  end
  
  def self.down
    drop_table :links
  end
end
