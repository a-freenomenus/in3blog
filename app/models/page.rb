class Page < ActiveRecord::Base
  has_friendly_id :permalink

  validates_presence_of :permalink, :body
  validates_uniqueness_of :permalink
end
