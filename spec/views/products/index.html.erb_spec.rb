require 'spec_helper'

describe "/products/index.html.erb" do
  include ProductsHelper

  before(:each) do
    assigns[:products] = [
      stub_model(Product,
        :code => "value for code",
        :name => "value for name",
        :description => "value for description",
        :consigner_id => 1,
        :wholesale => 1.5,
        :retail => 1.5
      ),
      stub_model(Product,
        :code => "value for code",
        :name => "value for name",
        :description => "value for description",
        :consigner_id => 1,
        :wholesale => 1.5,
        :retail => 1.5
      )
    ]
  end

  it "renders a list of products" do
    render
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
  end
end
