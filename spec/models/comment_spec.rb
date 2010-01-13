require 'spec_helper'

describe Comment do

  it "should validate presence of body" do
    comment = Comment.new
    comment.should have(1).error_on(:body)
  end

  it "should validate presence of username if user_id is nil" do
    comment = Comment.new(:user_id => nil)
    comment.should have(1).error_on(:username)
  end

  it "shouldn't validate presence of username if user_id NOT nil" do
    comment = Comment.new(:user_id => 1)
    comment.should have(0).error_on(:username)
  end

end
