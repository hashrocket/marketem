module ApplicationHelper

  def active_link_to(text, path, options={})
    if /^#{url_for(path)}/ =~ request.path
      options[:class] = "#{options[:class]} active".strip
    end
    link_to text, path, options
  end

  def page_heading(&block)
    content_tag :div, capture(&block), class: 'container heading'
  end

  def page_body(&block)
    content_tag :div, class: 'bodycontent' do
      content_tag :section, capture(&block), class: 'container'
    end
  end

end
