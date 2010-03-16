require 'spec_helper'

describe Product do
  before(:each) do
    @valid_attributes = {
      :code => "value for code",
      :name => "value for name",
      :description => "value for description",
      :consigner_id => 1,
      :wholesale => 1.5,
      :retail => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end
end
