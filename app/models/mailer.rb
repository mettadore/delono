class Mailer < ActionMailer::Base
  def invitation(invitation, signup_url)
    subject    'Invitation to Delono'
    recipients invitation.recipient_email
    from       invitation.sender.email
    body       :invitation => invitation, :signup_url => signup_url
    invitation.update_attribute(:sent_at, Time.now)
  end

end
