require 'spec_helper'

describe Admin::HomepageController do

  before(:each) do
    user = mock_model(User)
    user.stub!(:admin?).and_return(true)
    @controller.stub!(:current_user).and_return(user)
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
end
