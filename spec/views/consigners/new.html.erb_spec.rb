require 'spec_helper'

describe "/consigners/new.html.erb" do
  include ConsignersHelper

  before(:each) do
    assigns[:consigner] = stub_model(Consigner,
      :new_record? => true,
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

  it "renders new consigner form" do
    render

    response.should have_tag("form[action=?][method=post]", consigners_path) do
      with_tag("input#consigner_name[name=?]", "consigner[name]")
      with_tag("input#consigner_biz_name[name=?]", "consigner[biz_name]")
      with_tag("input#consigner_street[name=?]", "consigner[street]")
      with_tag("input#consigner_street_2[name=?]", "consigner[street_2]")
      with_tag("input#consigner_city[name=?]", "consigner[city]")
      with_tag("input#consigner_state[name=?]", "consigner[state]")
      with_tag("input#consigner_zipcode[name=?]", "consigner[zipcode]")
      with_tag("input#consigner_phone[name=?]", "consigner[phone]")
      with_tag("input#consigner_email[name=?]", "consigner[email]")
      with_tag("input#consigner_website[name=?]", "consigner[website]")
      with_tag("input#consigner_fax[name=?]", "consigner[fax]")
      with_tag("textarea#consigner_notes[name=?]", "consigner[notes]")
    end
  end
end
