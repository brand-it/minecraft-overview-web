module ApplicationHelper
  
  def overviewer_config_path
    'javascript/overviewerConfig.js'
  end
  
  def google_api_maps_path
    "http://maps.google.com/maps/api/js?sensor=false"
  end
  
  def javascript_google_maps_content_tag( options = {} )
    content_tag(:script, nil, { :type => Mime::JS, src: google_api_maps_path }.merge(options))
  end
  
  def javascript_overviewer_config_content_tag( options = {} )
    content_tag(:script, nil, { :type => Mime::JS, src: overviewer_config_path }.merge(options)) if File.exist?(overviewer_config_path)
  end
end
