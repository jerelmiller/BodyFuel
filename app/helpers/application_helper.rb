module ApplicationHelper
  def facebook_link
    link_to 'https://www.facebook.com/bodyfuel.colorado', target: :_blank, class: 'facebook' do
      content_tag :span, '', class: 'icon-facebook'
    end
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
end
