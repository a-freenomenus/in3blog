require File.dirname(__FILE__) + '/../spec_helper'

describe MenuItem do
  def new_menu_item(attributes = {})
    attributes[:name] ||= 'name'
    attributes[:url] ||= 'url'
    MenuItem.new(attributes) 
  end 
  
  before(:each) do
    MenuItem.delete_all
  end

  it "should be valid" do
    new_menu_item.should be_valid
  end

  it "should require name" do
    new_menu_item(:name => '').should have(1).error_on(:name)
  end

  it "should require url" do
    new_menu_item(:url => '').should have(1).error_on(:url)
  end
  
  it "should validate uniqueness of name" do
    new_menu_item(:name => 'name').save!
    new_menu_item(:name => 'name').should have(1).error_on(:name)
  end
end
