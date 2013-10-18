class OrderMailer < ActionMailer::Base
  layout 'mailer'
  helper ActionView::Helpers::UrlHelper

  def send_confirmation_email(order)
    @order = order
    mail to: 'jerelmiller@gmail.com', subject: "Order Confirmation", from: 'jerelmiller@gmail.com', reply_to: 'jerelmiller@gmail.com'
  end
end