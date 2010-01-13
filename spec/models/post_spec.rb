require File.dirname(__FILE__) + '/../spec_helper'

describe Post do

  it "should require body and title" do
    post = Post.new
    %w(body title).each do |attr|
      post.should have(1).error_on(attr)
    end
  end

  it "should find correctly with primitive_search method" do
    p1 = Factory.create(:post, :title => "foo", :body => "bar")
    p2 = Factory.create(:post, :title => "bar", :body => "foo")
    p3 = Factory.create(:post, :title => "lorem", :body => "ipsum")
    Post.primitive_search("foo").should == [p1, p2]
  end

  it "should sort recent posts in descending order by created_at time" do
    p1 = Factory.create(:post, :created_at => 1.day.ago)
    p2 = Factory.create(:post, :created_at => Time.now)
    Post.recent.should == [p2, p1]
  end

end
