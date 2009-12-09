class Invitation < ActiveRecord::Base
  belongs_to :recipient, :class_name => 'User'

  validates_presence_of :recipient_email
  validates_format_of :recipient_email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validate :recipient_is_not_registered

  before_create :generate_token

  def used?
    not self.recipient.nil?
  end

  private

  def recipient_is_not_registered
    errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

end
