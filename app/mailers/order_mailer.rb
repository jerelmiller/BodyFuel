class OrderMailer < ActionMailer::Base
  layout 'mailer'
  helper ActionView::Helpers::UrlHelper

  def send_confirmation_email(order)
    @order = order
    mail to: 'bodyfuel2u@gmail.com', subject: "BodyFuel Order Confirmation", from: 'BodyFuel <bodyfuel2u@gmail.com>', reply_to: 'BodyFuel <bodyfuel2u@gmail.com>'
  end

  def send_notification_email(order)
    @order = order
    mail to: 'bodyfuel2u@gmail.com', subject: 'BodyFuel Order Notification', from: 'BodyFuel <bodyfuel2u@gmail.com>', reply_to: 'BodyFuel <bodyfuel2u@gmail.com>'
  end
end