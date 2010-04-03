require 'spec_helper'

describe "/invitations/index.html.erb" do
  include InvitationsHelper

  before(:each) do
    assigns[:invitations] = [
      stub_model(Invitation,
        :sender_id => 1,
        :recipient_email => "value for recipient_email",
        :token => "value for token"
      ),
      stub_model(Invitation,
        :sender_id => 1,
        :recipient_email => "value for recipient_email",
        :token => "value for token"
      )
    ]
  end

  it "renders a list of invitations" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for recipient_email".to_s, 2)
    response.should have_tag("tr>td", "value for token".to_s, 2)
  end
end
