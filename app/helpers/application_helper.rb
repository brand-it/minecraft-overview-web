module ApplicationHelper
  
  # :section: Google Maps
  # This is all the google maps system
  
  ##
  # Google maps url, change this if for some reason google changes this URL
  # 
  # call-seq:
  #    google_maps_url() => 'http://maps.google.com'
  
  def google_maps_url
    'http://maps.google.com'
  end
  
  ##
  # Google maps api path. 
  #
  # This means it has calles the api or the information needed to run the overview config application. 
  # 
  # It uses the same open source API that google provides in combination with a bit of magic created by the python code
  # 
  # Change the #google_maps_url method if you want to change the domain name information
  # 
  # call-seq:
  #    google_api_maps_path => 'http://maps.google.com/maps/api/js?sensor=false'
  
  def google_api_maps_path
    "#{google_maps_url}/maps/api/js?sensor=false"
  end
  
  ##
  # Google maps api path. 
  #
  # Creates script text/javascript for google maps
  #
  # 
  #    javascript_google_maps_content_tag() #=> "<script src=\"http://maps.google.com/maps/api/js?sensor=false\" type=\"text/javascript\"></script>"
  #    javascript_google_maps_content_tag( async: 'async' ) #=> "<script async=\"async\" src=\"http://maps.google.com/maps/api/js?sensor=false\" type=\"text/javascript\"></script>"
  #
  # call-seq:
  #    javascript_google_maps_content_tag( options = {} ) => String
  
  def javascript_google_maps_content_tag( options = {} )
    content_tag(:script, nil, { :type => Mime::JS, src: google_api_maps_path }.merge(options))
  end
  
  # :section: Overviewer Config
  # This include overview config information along with some content tag information
  
  # If you need something related to the overview config system you should look to this area
  #
  # call-seq:
  #    overviewer_config_path => 'javascript/overviewerConfig.js'

  def overviewer_config_path
    'javascript/overviewerConfig.js'
  end
  
  # If you need something related to the overview config system you should look to this area
  #
  #    javascript_overviewer_config_content_tag #=> "<script src=\"javascript/overviewerConfig.js\" type=\"text/javascript\"></script>"
  #    
  #
  # call-seq:
  #    javascript_overviewer_config_content_tag( options = {} ) => String
  
  def javascript_overviewer_config_content_tag( options = {} )
    content_tag(:script, nil, { :type => Mime::JS, src: overviewer_config_path }.merge(options))
  end
  
end
