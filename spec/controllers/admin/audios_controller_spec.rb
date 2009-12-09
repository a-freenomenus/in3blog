require 'spec_helper'

describe Admin::AudiosController do

  before(:each) do
    user = mock_model(User)
    user.stub!(:admin?).and_return(true)
    @controller.stub!(:current_user).and_return(user)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
end
