class ContactMailer < ActionMailer::Base
  layout 'mailer'
  helper ActionView::Helpers::UrlHelper

  def send_contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail to: 'jerelmiller@gmail.com', subject: "New message from #{name}", from: 'bodyfuel2u@gmail.com', reply_to: "#{name} <#{email}>"
  end
end