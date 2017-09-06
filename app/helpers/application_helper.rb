module ApplicationHelper
  def markdown(input)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(input).html_safe
  end
end
