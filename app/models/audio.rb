require 'mp3info'

class Audio < ActiveRecord::Base
  has_attached_file :mp3,
      :url  => "/assets/audios/:id_:basename.:extension",
      :path => ":rails_root/public/assets/audios/:id_:basename.:extension"
  validates_attachment_presence :mp3
  validates_attachment_size :mp3,
      :less_than => 20.megabytes,
      :message => 'filesize must be less than 20 MegaBytes'
  validates_attachment_content_type :mp3,
      :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ],
      :message => 'file must be of filetype .mp3'

  after_mp3_post_process :fill_info

  belongs_to :post

  private

  def fill_info
    Mp3Info.open(mp3.queued_for_write[:original].path) do |mp3info|
      self.bitrate = mp3info.bitrate
      self.title = mp3info.tag.title
      self.artist = mp3info.tag.artist
    end
  end

end
