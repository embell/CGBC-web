# Mailer used for contact forms on the Contact page
class ContactMailer < ActionMailer::Base
  default from: 'CGBC-Web <no-reply@mail.cgbc-nc.com>'

  def default_emails
    ['emb1234@gmail.com']
  end

  def contact_email(name, email, comment)
    @name = name
    @email = email
    @comment = comment
    mail(to: default_emails, subject: 'New question/comment from CGBC website')
  end
end
