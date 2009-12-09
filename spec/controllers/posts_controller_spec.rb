require File.dirname(__FILE__) + '/../spec_helper'
 
describe PostsController do
  fixtures :all
  #integrate_views
  
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

  describe "when user logged in" do

    before(:each) do
      @user = mock_model(User)
      @controller.stub!(:current_user).and_return(@user)
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end
    
    it "create action should render new template when model is invalid" do
      Post.any_instance.stubs(:valid?).returns(false)
      post :create, :post => {}
      response.should render_template(:new)
    end
    
    it "create action should redirect when model is valid" do
      Post.any_instance.stubs(:valid?).returns(true)
      post :create, :post => { :title => 'title' }
      response.should redirect_to(posts_path)
    end

    describe "when user have admin rights" do

      before(:each) do
        @user.stub!(:admin?).and_return(true)
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
        response.should redirect_to(posts_path)
      end
      
      it "destroy action should destroy model and redirect to index action" do
        post = Post.first
        delete :destroy, :id => post
        response.should redirect_to(posts_path)
        Post.exists?(post.id).should be_false
      end

    end

  end

  describe "when user NOT logged in" do

    it "new action should redirect to login url" do
      get :new
      response.should redirect_to(login_url)
    end
    
    it "create action should redirect to login url" do
      Post.any_instance.stubs(:valid?).returns(false)
      post :create, :post => {}
      response.should redirect_to(login_url)
    end
    
    it "edit action should redirect to login url" do
      get :edit, :id => Post.first
      response.should redirect_to(login_url)
    end

    it "update action should redirect to login url" do
      put :update, :id => Post.first
      response.should redirect_to(login_url)
    end

    it "destroy action should redirect to login url" do
      post = Post.first
      delete :destroy, :id => post
      response.should redirect_to(login_url)
    end

  end

end
