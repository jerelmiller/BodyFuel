module ApplicationHelper
  def facebook_link
    social_link 'https://www.facebook.com/bodyfuel.colorado', 'icon-facebook'
  end

  def twitter_link
    social_link 'https://www.twitter.com', 'icon-twitter'
  end

  def instagram_link
    social_link 'http://www.instagram.com/bodyfuelnation', 'icon-instagram'
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new object, self
    yield presenter if block_given?
    presenter
  end

  def format_time(time, options = {})
    options[:format] ||= :date

    case options[:format]
    when :date then time.strftime '%b %-d, %Y'
    end
  end

  private

  def social_link(href, icon_class)
    link_to href, target: :_blank do
      content_tag :i, '', class: icon_class
    end
  end
end
