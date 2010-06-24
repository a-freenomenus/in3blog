class Comment < ActiveRecord::Base
  belongs_to :post, :counter_cache => true
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :username, :if => Proc.new { |comment| comment.user_id.nil? }
  
  def self.find_user_comments(user)
    self.find(:all, :conditions => "user_id = #{user.id}")
  end
end
