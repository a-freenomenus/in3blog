class MenuItem < ActiveRecord::Base
  acts_as_list

  named_scope :visible, :conditions => { :visible => true }
  named_scope :invisible, :conditions => { :visible => false }

  validates_presence_of :name, :url
  validates_uniqueness_of :name
end
