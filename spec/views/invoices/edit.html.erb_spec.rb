require 'spec_helper'

describe "/invoices/edit.html.erb" do
  include InvoicesHelper

  before(:each) do
    assigns[:invoice] = @invoice = stub_model(Invoice,
      :new_record? => false,
      :business_id => 1,
      :consigner_id => 1
    )
  end

  it "renders the edit invoice form" do
    render

    response.should have_tag("form[action=#{invoice_path(@invoice)}][method=post]") do
      with_tag('input#invoice_business_id[name=?]', "invoice[business_id]")
      with_tag('input#invoice_consigner_id[name=?]', "invoice[consigner_id]")
    end
  end
end
