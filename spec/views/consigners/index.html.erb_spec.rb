require 'spec_helper'

describe "/consigners/index.html.erb" do
  include ConsignersHelper

  before(:each) do
    assigns[:consigners] = [
      stub_model(Consigner,
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
      ),
      stub_model(Consigner,
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
    ]
  end

  it "renders a list of consigners" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for biz_name".to_s, 2)
    response.should have_tag("tr>td", "value for street".to_s, 2)
    response.should have_tag("tr>td", "value for street_2".to_s, 2)
    response.should have_tag("tr>td", "value for city".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for website".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
