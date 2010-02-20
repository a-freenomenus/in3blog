class Page < ActiveRecord::Base
  has_friendly_id :permalink

  validates_presence_of :body
  validates_uniqueness_of :permalink, :allow_blank => true

  def to_param
    permalink.blank? ? id.to_s : permalink
  end

end
