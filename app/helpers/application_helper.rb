module ApplicationHelper
  def tagline(text)
    content_for(:tagline) { %Q(<div class="tagline"><p>#{text}</p></div>).html_safe }
  end
end
