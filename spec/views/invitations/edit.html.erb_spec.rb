require 'spec_helper'

describe "/invitations/edit.html.erb" do
  include InvitationsHelper

  before(:each) do
    assigns[:invitation] = @invitation = stub_model(Invitation,
      :new_record? => false,
      :sender_id => 1,
      :recipient_email => "value for recipient_email",
      :token => "value for token"
    )
  end

  it "renders the edit invitation form" do
    render

    response.should have_tag("form[action=#{invitation_path(@invitation)}][method=post]") do
      with_tag('input#invitation_sender_id[name=?]', "invitation[sender_id]")
      with_tag('input#invitation_recipient_email[name=?]', "invitation[recipient_email]")
      with_tag('input#invitation_token[name=?]', "invitation[token]")
    end
  end
end
