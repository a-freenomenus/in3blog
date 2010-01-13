require 'spec_helper'

describe Invitation do

  it "should validate uniqueness of recipient" do
    Factory.create(:invitation, :recipient_email => 'foo@example.com')
    invitation = Factory.build(:invitation, :recipient_email => 'foo@example.com')
    invitation.should have(1).error_on(:recipient_email)
  end

  it "should require well formed email" do
    invitation = Invitation.new(:recipient_email => 'foo@bar@example.com')
    invitation.should have(1).error_on(:recipient_email)
  end

  it "should require unused email" do
    Factory.create(:user, :email => 'foo@example.com')
    invitation = Invitation.new(:recipient_email => 'foo@example.com')
    invitation.should have(1).error_on(:recipient_email)
  end

  it "should generate token after saving" do
    invitation = Factory.create(:invitation)
    invitation.token.should_not be_blank
  end

  it "should not be used after creation" do
    invitation = Factory.create(:invitation)
    invitation.used?.should be_false
  end

end
