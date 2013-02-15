module ApplicationHelper
  
  def javascript_google_maps_content_tag(options = {})
    content_tag(:script, nil, { :type => Mime::JS, src: "http://maps.google.com/maps/api/js?sensor=false" }.merge(options))
  end
  
  def javascript_overviewer_config_content_tag(options = {})
    content_tag(:script, nil, { :type => Mime::JS, src: "javascript/overviewerConfig.js" }.merge(options))
  end
  
  def overview_javascript_content_tag(source, options = {})
    content_tag(:script, nil, { :type => Mime::JS, src: ("assets/maps/" + source) }.merge(options))
  end
  
  def overview_css_tag(source, options = {})
    tag(:link, {href: "assets/" + source, media: :all, rel: :stylesheet, type: Mime::CSS}.merge(options))
  end
end
