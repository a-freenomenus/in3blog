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
  
  it "should assign tags to post" do
    post = Factory.create(:post, :tag_list => 'foo, bar')
    post.tags.map(&:name).should == %w[foo bar]
  end

  it "should find tagged post" do
    p1 = Factory.create(:post, :tag_list => 'foo, bar')
    p2 = Factory.create(:post, :tag_list => 'foo')
    p3 = Factory.create(:post, :tag_list => 'bar')
    Post.find_tagged_with('bar').should == [p1, p3]
  end

  it "should correctly generate to_param" do
    post = Factory.create(:post, :title => 'foo bar')
    post.to_param.should == 'foo-bar'
  end


end
