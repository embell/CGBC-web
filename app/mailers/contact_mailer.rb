class ContactMailer < ActionMailer::Base
  default from: "contact@cgbc-nc.com"

  def default_emails
    ['emb1234@gmail.com']
  end

  def contact_email(name, email, comment)
    # Maybe 'to:' instead of bcc?
    mail(bcc: default_emails, subject: "New question/comment from CGBC website")
  end
end
