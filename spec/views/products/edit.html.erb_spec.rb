require 'spec_helper'

describe "/products/edit.html.erb" do
  include ProductsHelper

  before(:each) do
    assigns[:product] = @product = stub_model(Product,
      :new_record? => false,
      :code => "value for code",
      :name => "value for name",
      :description => "value for description",
      :consigner_id => 1,
      :wholesale => 1.5,
      :retail => 1.5
    )
  end

  it "renders the edit product form" do
    render

    response.should have_tag("form[action=#{product_path(@product)}][method=post]") do
      with_tag('input#product_code[name=?]', "product[code]")
      with_tag('input#product_name[name=?]', "product[name]")
      with_tag('textarea#product_description[name=?]', "product[description]")
      with_tag('input#product_consigner_id[name=?]', "product[consigner_id]")
      with_tag('input#product_wholesale[name=?]', "product[wholesale]")
      with_tag('input#product_retail[name=?]', "product[retail]")
    end
  end
end
