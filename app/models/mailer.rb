class Mailer < ActionMailer::Base
  

  def invitation(invitation, signup_url)
    subject    'Invitation for in3blog'
    recipients invitation.recipient_email
    from       'foo@example.com'
    body       :invitation => invitation, :signup_url => signup_url
  end

end
