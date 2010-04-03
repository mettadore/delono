require 'spec_helper'

describe "/invitations/new.html.erb" do
  include InvitationsHelper

  before(:each) do
    assigns[:invitation] = stub_model(Invitation,
      :new_record? => true,
      :sender_id => 1,
      :recipient_email => "value for recipient_email",
      :token => "value for token"
    )
  end

  it "renders new invitation form" do
    render

    response.should have_tag("form[action=?][method=post]", invitations_path) do
      with_tag("input#invitation_sender_id[name=?]", "invitation[sender_id]")
      with_tag("input#invitation_recipient_email[name=?]", "invitation[recipient_email]")
      with_tag("input#invitation_token[name=?]", "invitation[token]")
    end
  end
end
