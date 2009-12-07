require File.dirname(__FILE__) + '/../spec_helper'
 
describe PostsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Post.first
    response.should render_template(:show)
  end

  it "feed action should render feed template with format 'rss'" do
    get :feed, :format => :rss
    response.should render_template(:feed)
  end
  
end
