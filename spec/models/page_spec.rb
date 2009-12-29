require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  def new_page(attributes = {})
    attributes[:permalink] ||= 'permalink'
    attributes[:body] ||= 'body'
    Page.new(attributes) 
  end 
  
  before(:each) do
    Invitation.delete_all
  end

  it "should be valid" do
    new_page.should be_valid
  end

  it "should require permalink" do
    new_page(:permalink => '').should have(1).error_on(:permalink)
  end

  it "should require body" do
    new_page(:body => '').should have(1).error_on(:body)
  end
  
  it "should validate uniqueness of permalink" do
    new_page(:permalink => 'permalink').save!
    new_page(:permalink => 'permalink').should have(1).error_on(:permalink)
  end

end
