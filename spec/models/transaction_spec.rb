require 'spec_helper'

describe Transaction do
  before(:each) do
    @valid_attributes = {
      :business_id => 1,
      :product_id => 1,
      :transaction_type_id => 1,
      :wholesale => 1.5,
      :retail => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    Transaction.create!(@valid_attributes)
  end
end
