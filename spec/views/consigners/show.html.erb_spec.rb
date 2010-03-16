require 'spec_helper'

describe "/consigners/show.html.erb" do
  include ConsignersHelper
  before(:each) do
    assigns[:consigner] = @consigner = stub_model(Consigner,
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
      :notes => "value for notes"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ biz_name/)
    response.should have_text(/value\ for\ street/)
    response.should have_text(/value\ for\ street_2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ website/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ notes/)
  end
end
