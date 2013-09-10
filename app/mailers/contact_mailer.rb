class ContactMailer < ActionMailer::Base
  layout 'mailer'
  helper ActionView::Helpers::UrlHelper

  def send_contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail to: 'jerelmiller@gmail.com', subject: "New message from #{name}", from: 'jerelmiller@gmail.com', reply_to: 'jerelmiller@gmail.com'
  end
end