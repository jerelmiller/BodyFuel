module ApplicationHelper
  def facebook_link
    link_to 'https://www.facebook.com/bodyfuel.colorado', target: :_blank, class: 'facebook' do
      content_tag :span, '', class: 'icon-facebook'
    end
  end
end
