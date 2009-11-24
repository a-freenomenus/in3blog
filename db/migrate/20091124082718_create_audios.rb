class CreateAudios < ActiveRecord::Migration
  def self.up
    create_table :audios do |t|
      t.string :mp3_file_name
      t.string :mp3_content_type
      t.integer :mp3_file_size
      t.datetime :mp3_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :audios
  end
end
