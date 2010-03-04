require 'spec_helper'

describe "/businesses/edit.html.erb" do
  include BusinessesHelper

  before(:each) do
    assigns[:business] = @business = stub_model(Business,
      :new_record? => false,
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

  it "renders the edit business form" do
    render

    response.should have_tag("form[action=#{business_path(@business)}][method=post]") do
      with_tag('input#business_name[name=?]', "business[name]")
      with_tag('input#business_street[name=?]', "business[street]")
      with_tag('input#business_street_2[name=?]', "business[street_2]")
      with_tag('input#business_city[name=?]', "business[city]")
      with_tag('input#business_state[name=?]', "business[state]")
      with_tag('input#business_zipcode[name=?]', "business[zipcode]")
      with_tag('input#business_email[name=?]', "business[email]")
      with_tag('input#business_website[name=?]', "business[website]")
      with_tag('input#business_fax[name=?]', "business[fax]")
      with_tag('input#business_owner_id[name=?]', "business[owner_id]")
      with_tag('input#business_phone[name=?]', "business[phone]")
      with_tag('input#business_subdomain[name=?]', "business[subdomain]")
    end
  end
end
