require 'spec_helper'

describe Business do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :street => "value for street",
      :street_2 => "value for street_2",
      :city => "value for city",
      :state => "value for state",
      :zipcode => 1,
      :email => "value for email",
      :website => "value for website",
      :fax => 1,
      :owner_id => 1,
      :phone => 1,
      :subdomain => "value for subdomain"
    }
  end

  it "should create a new instance given valid attributes" do
    Business.create!(@valid_attributes)
  end
end
