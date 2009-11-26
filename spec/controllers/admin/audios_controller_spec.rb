require 'spec_helper'

describe Admin::AudiosController do

  #Delete these examples and add some real ones
  it "should use Admin::AudiosController" do
    controller.should be_an_instance_of(Admin::AudiosController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
end
