require File.dirname(__FILE__) + '/../spec_helper'

describe Post do

  def new_post(attributes = {})
    attributes[:title] ||= 'title' 
    attributes[:body] ||= 'body'
    Post.new(attributes)   
  end 

  it "should be valid" do
    new_post.should be_valid
  end

  it "should require body" do
    new_post(:body => '').should have(1).error_on(:body)
  end

  it "should require title" do
    new_post(:title => '').should have(1).error_on(:title)
  end

end
