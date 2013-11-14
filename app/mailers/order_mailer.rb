class OrderMailer < ActionMailer::Base
  layout 'mailer'
  helper ActionView::Helpers::UrlHelper

  def send_confirmation_email(order)
    @order = order
    mail to: 'jerelmiller@gmail.com', subject: "BodyFuel Order Confirmation", from: 'jerelmiller@gmail.com', reply_to: 'jerelmiller@gmail.com'
  end

  def send_notification_email(order)
    @order = order
    mail to: 'jerelmiller@gmail.com', subject: 'BodyFuel Order Notification', from: 'jerelmiller@gmail.com', reply_to: 'jerelmiller@gmail.com'
  end
end