class AddBitrateArtistTitleToAudio < ActiveRecord::Migration
  def self.up
    add_column :audios, :title, :string
    add_column :audios, :artist, :string
    add_column :audios, :bitrate, :integer
  end

  def self.down
    remove_column :audios, :bitrate
    remove_column :audios, :artist
    remove_column :audios, :title
  end
end
