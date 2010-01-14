require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  
  it "should require premalink and body" do
    page = Page.new
    %w(body permalink).each do |attr|
      page.should have(1).error_on(attr)
    end
  end
  
  it "should validate uniqueness of permalink" do
    Factory.create(:page, :permalink => 'foo')
    page = Factory.build(:page, :permalink => 'foo')
    page.should have(1).error_on(:permalink)
  end

end
