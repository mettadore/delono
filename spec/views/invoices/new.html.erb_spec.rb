require 'spec_helper'

describe "/invoices/new.html.erb" do
  include InvoicesHelper

  before(:each) do
    assigns[:invoice] = stub_model(Invoice,
      :new_record? => true,
      :business_id => 1,
      :consigner_id => 1
    )
  end

  it "renders new invoice form" do
    render

    response.should have_tag("form[action=?][method=post]", invoices_path) do
      with_tag("input#invoice_business_id[name=?]", "invoice[business_id]")
      with_tag("input#invoice_consigner_id[name=?]", "invoice[consigner_id]")
    end
  end
end
