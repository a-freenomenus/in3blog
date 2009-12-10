require 'spec_helper'

describe Comment do

  def new_comment(attributes = {})
    attributes[:body] ||= 'text of comment'
    attributes[:user_id] ||= 1
    attributes[:username] ||= 'username'
    attributes[:post_id] ||= 1
    Comment.new(attributes)
  end

  before(:each) do
    Comment.delete_all
  end
  
  it "should be valid" do
    new_comment.should be_valid
  end

  it "should require body" do
    new_comment(:body => '').should have(1).error_on(:body)
  end

  it "should require username if user_id is nil" do
    new_comment(:username => '', :user_id => nil).should have(1).error_on(:username)
  end

end
