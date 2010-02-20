require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  
  it "should require body" do
    page = Page.new
    page.should have(1).error_on(:body)
  end
  
  it "should validate uniqueness of permalink" do
    Factory.create(:page, :permalink => 'foo')
    page = Factory.build(:page, :permalink => 'foo')
    page.should have(1).error_on(:permalink)
  end

  it "to_param sould be eqals id if permalink not setted" do
    page = Factory.build(:page, :id => '1', :permalink => '')
    page.to_param.should == '1'
  end
  
  it "to_param sould be equals permalink if permalink setted" do
    page = Factory.build(:page, :permalink => 'foo')
    page.to_param.should == 'foo'
  end

end
