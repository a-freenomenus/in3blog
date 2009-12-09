require 'spec_helper'

describe Invitation do

  def new_invitation(attributes = {})
    attributes[:recipient_email] ||= 'foo@example.com'
    attributes[:token] ||= 'abc123'
    Invitation.new(attributes)
  end
  
  before(:each) do
    Invitation.delete_all
  end

  it "should be valid" do
    new_invitation.should be_valid
  end

  it "should require well formed email" do
    new_invitation(:recipient_email => 'foo@bar@example.com').should have(1).error_on(:recipient_email)
  end

  it "should require unused email" do
    User.stub!(:find_by_email).and_return(mock_model(User))
    new_invitation.should have(1).error_on(:recipient_email)
  end

  it "should generate token after saving" do
    invitation = new_invitation
    invitation.save
    invitation.token.should_not be_blank
  end

  it "should not be used after creation" do
    invitation = new_invitation
    invitation.used?.should be_false
  end

end
