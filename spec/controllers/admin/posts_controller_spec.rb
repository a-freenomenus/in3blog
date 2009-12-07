require File.dirname(__FILE__) + '/../../spec_helper'
 
describe Admin::PostsController do
  fixtures :all
  integrate_views

  before(:each) do
    controller.stub!(:authenticate).and_return(true)
  end
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Post.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Post.any_instance.stubs(:valid?).returns(true)
    post :create, :post => { :title => 'title' }
    response.should redirect_to(admin_posts_path)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Post.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Post.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Post.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Post.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Post.first
    response.should redirect_to(admin_posts_path)
  end
  
  it "destroy action should destroy model and redirect to index action" do
    post = Post.first
    delete :destroy, :id => post
    response.should redirect_to(admin_posts_path)
    Post.exists?(post.id).should be_false
  end
end
