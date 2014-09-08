class MailService
  def send_email(from, to, subject, body)
    opts = { from: from, to: to, subject: subject, body: body}
    mail = ActionMailer::Base.mail opts
    !!mail.deliver # Return true if we had much success
  end
end
