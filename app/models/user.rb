class User < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :email, :password, :password_confirmation, :old_password, :open_id
  
  has_friendly_id :username

  has_many :posts

  named_scope :admins, :conditions => { :admin => true }
  named_scope :editors, :conditions => { :admin => false }
  named_scope :with_open_id, :conditions => { :open_id => true }
  
  attr_accessor :password, :old_password, :updating_password
  before_save :prepare_password
  
  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :if => :should_validate_password?
  validates_confirmation_of :password, :if => :should_validate_password?
  validates_length_of :password, :minimum => 4, :allow_blank => true, :if => :should_validate_password?
  validates_presence_of :old_password, :if => :updating_password
  validate :old_password_matching, :if => :updating_password
  
  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.matching_password?(pass)
  end
  
  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end

  def self.find_by_open_id(open_id)
    with_open_id.find_by_username(open_id)
  end

  private
  
  def prepare_password
    unless password.blank?
      self.password_salt = Digest::SHA1.hexdigest([Time.now, rand].join)
      self.password_hash = encrypt_password(password)
    end
  end
  
  def encrypt_password(pass)
    Digest::SHA1.hexdigest([pass, password_salt].join)
  end

  def should_validate_password?
    updating_password || new_record?
  end

  def old_password_matching
    @errors.add(:old_password, "does not match") unless self.matching_password?(old_password)
  end

end
