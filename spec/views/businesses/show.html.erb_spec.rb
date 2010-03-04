require 'spec_helper'

describe "/businesses/show.html.erb" do
  include BusinessesHelper
  before(:each) do
    assigns[:business] = @business = stub_model(Business,
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
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ street/)
    response.should have_text(/value\ for\ street_2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ website/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ subdomain/)
  end
end
