require 'spec_helper'

describe Picture do
  before(:each) do
    @valid_attributes = {
      :image_file_name => "image_fiel_name.jpg",
      :image_content_type => "image/jpeg",
      :image_file_size => 1,
      :image_updated_at => Time.now,
      :post_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Picture.create!(@valid_attributes)
  end
end
