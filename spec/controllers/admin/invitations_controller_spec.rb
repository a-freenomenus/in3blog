require 'spec_helper'

describe Admin::InvitationsController do

  #Delete these examples and add some real ones
  it "should use Admin::InvitationsController" do
    controller.should be_an_instance_of(Admin::InvitationsController)
  end

  before(:each) do
    user = mock_model(User)
    user.stub!(:admin?).and_return(true)
    @controller.stub!(:current_user).and_return(user)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "create action should render new template when model is invalid" do
    Invitation.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Invitation.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_invitations_path)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  # it "destroy action should destroy model and redirect to index action" do
  #   invitation = Invitation.first
  #   delete :destroy, :id => invitation
  #   response.should redirect_to(admin_invitations_path)
  #   Invitation.exists?(invitation.id).should be_false
  # end
end
