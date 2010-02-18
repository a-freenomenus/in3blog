class Link < ActiveRecord::Base
  acts_as_list
   
  default_scope :order => :position
     
  named_scope :visible, :conditions => { :visible => true }
  named_scope :invisible, :conditions => { :visible => false }

  validates_presence_of :url, :name, :target

  def target_blank?
    target == 'blank'
  end

end
