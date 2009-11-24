require 'spec_helper'

describe Audio do
  before(:each) do
    @valid_attributes = {
      :mp3_file_name => "mp3_file_name.mp3",
      :mp3_content_type => "application/mp3",
      :mp3_file_size => 1,
      :mp3_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Audio.create!(@valid_attributes)
  end
end
