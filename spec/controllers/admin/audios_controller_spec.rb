require 'spec_helper'

describe Admin::AudiosController do
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
end
