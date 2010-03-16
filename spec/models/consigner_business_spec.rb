require 'spec_helper'

describe ConsignerBusiness do
  before(:each) do
    @valid_attributes = {
      :consigner_id => 1,
      :business_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    ConsignerBusiness.create!(@valid_attributes)
  end
end
