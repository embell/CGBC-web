# Catch mail requests and fulfill them with the mailer
class MailController < ApplicationController
  def send_contact_mail
    ContactMailer.contact_email(params[:name], params[:email], params[:comments]).deliver
    redirect_to '/contact', notice: 'Your message has been submitted. Thanks for your feedback.'
  end
end
