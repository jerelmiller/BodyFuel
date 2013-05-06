module ApplicationHelper
  def facebook_link
    link_to 'https://www.facebook.com/bodyfuel.colorado', target: :_blank do
      content_tag :span, '', class: 'icon-facebook facebook'
    end
  end
end
