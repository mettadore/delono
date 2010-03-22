require 'spec_helper'

describe "/invoices/show.html.erb" do
  include InvoicesHelper
  before(:each) do
    assigns[:invoice] = @invoice = stub_model(Invoice,
      :business_id => 1,
      :consigner_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
