class OrderMailer < ActionMailer::Base
  layout 'mailer'
  helper ActionView::Helpers::UrlHelper

  def send_confirmation_email(order)
    @order = order
    mail to: 'jerelmiller@gmail.com', subject: "BodyFuel Order Confirmation", from: 'bodyfuel2u@gmail.com', reply_to: 'bodyfuel2u@gmail.com'
  end

  def send_notification_email(order)
    @order = order
    mail to: 'jerelmiller@gmail.com', subject: 'BodyFuel Order Notification', from: 'bodyfuel2u@gmail.com', reply_to: 'bodyfuel2u@gmail.com'
  end
end