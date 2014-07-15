module ApplicationHelper
  def my_name
    "Devan Beitel"
  end

  def error_tag(errors)
    if errors.any?
      'has-error'
    end
  end
  
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end
end
