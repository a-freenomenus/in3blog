class Picture < ActiveRecord::Base
  has_attached_file :image,
      :url  => "/assets/images/:id_:basename.:extension",
      :path => ":rails_root/public/assets/images/:id_:basename.:extension",
      :styles => {  :medium => "500x500>",
                    :thumb => "100x100>" }
  validates_attachment_presence :image
  validates_attachment_size :image,
      :less_than => 2.megabytes,
      :message => 'filesize must be less than 5 MegaBytes'
  validates_attachment_content_type :image,
      :content_type => ['image/jpeg', 'image/gif', 'image/jpg', 'image/png'],
      :message => 'file must be of filetype .mp3'
end
