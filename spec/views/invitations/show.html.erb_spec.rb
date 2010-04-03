require 'spec_helper'

describe "/invitations/show.html.erb" do
  include InvitationsHelper
  before(:each) do
    assigns[:invitation] = @invitation = stub_model(Invitation,
      :sender_id => 1,
      :recipient_email => "value for recipient_email",
      :token => "value for token"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ recipient_email/)
    response.should have_text(/value\ for\ token/)
  end
end
