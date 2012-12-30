module ApplicationHelper
  
  def javascript_include_overview
    render partial: "shared/javascript"
  end
  
  def overview_javascript_content_tag(source, options = {})
    content_tag("script", "", { "type" => Mime::JS, "src" => "javascript/" + source }.merge(options))
  end
  
  def overview_css_tag(source, options = {})
    tag(:link, {href: "css/" + source, media: :all, rel: :stylesheet, type: Mime::CSS}.merge(options))
  end
end
