require File.dirname(__FILE__) + '/../spec_helper'

describe MenuItem do

  it "should validate name and url" do
    item = MenuItem.new
    %w(name url).each do |attr|
      item.should have(1).error_on(attr)
    end
  end

  it "should validate uniqueness of name" do
    Factory.create(:menu_item, :name => 'foo')
    item = Factory.build(:menu_item, :name => 'foo')
    item.should have(1).error_on(:name)
  end

end
