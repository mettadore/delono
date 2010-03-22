require 'spec_helper'

describe Invoice do
  before(:each) do
    @valid_attributes = {
      :business_id => 1,
      :consigner_id => 1,
      :date => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Invoice.create!(@valid_attributes)
  end
end
