require 'spec_helper'

describe Consigner do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :biz_name => "value for biz_name",
      :street => "value for street",
      :street_2 => "value for street_2",
      :city => "value for city",
      :state => "value for state",
      :zipcode => 1,
      :phone => 1,
      :email => "value for email",
      :website => "value for website",
      :fax => 1,
      :notes => "value for notes",
      :last_invoiced => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Consigner.create!(@valid_attributes)
  end
end
