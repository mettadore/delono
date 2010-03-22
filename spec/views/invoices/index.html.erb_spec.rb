require 'spec_helper'

describe "/invoices/index.html.erb" do
  include InvoicesHelper

  before(:each) do
    assigns[:invoices] = [
      stub_model(Invoice,
        :business_id => 1,
        :consigner_id => 1
      ),
      stub_model(Invoice,
        :business_id => 1,
        :consigner_id => 1
      )
    ]
  end

  it "renders a list of invoices" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
