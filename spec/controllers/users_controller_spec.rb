require File.dirname(__FILE__) + '/../spec_helper'
 
describe UsersController do
  fixtures :all
  integrate_views

  describe "register action" do

    it "register action should redirect when token not given or invitation not found" do
      get :register
      response.should redirect_to(root_url)
    end

    describe "when invitation has found" do

      before(:each) do
        @invitation = stub_model(Invitation)
        Invitation.stub!(:find_by_token).and_return(@invitation)
      end

      it "should redirect when invitation has been used already" do
        @invitation.stub!(:used?).and_return(true)
        get :register
        response.should redirect_to(root_path)
      end

      it "should render register action when invitation hasn't been used already" do
        @invitation.stub!(:used?).and_return(false)
        @invitation.stub!(:update_attribute)
        get :register
        response.should render_template(:register)
      end

    end

  end
  
end
