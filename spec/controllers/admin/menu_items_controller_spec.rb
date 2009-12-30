require File.dirname(__FILE__) + '/../../spec_helper'
 
describe Admin::MenuItemsController do
  fixtures :all
  integrate_views
  
  before(:each) do
    user = User.find('admin')
    @controller.stub!(:current_user).and_return(user)
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
    MenuItem.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    MenuItem.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_menu_items_path)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => MenuItem.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    MenuItem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => MenuItem.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    MenuItem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => MenuItem.first
    response.should redirect_to(admin_menu_items_path)
  end
  
  it "destroy action should destroy model and redirect to index action" do
    menu_item = MenuItem.first
    delete :destroy, :id => menu_item
    response.should redirect_to(admin_menu_items_path)
    MenuItem.exists?(menu_item.id).should be_false
  end
end
