##
# Custom bootstrap helper
module BootstrapHelper
  
  # Standard boot strap icons
  #
  #    bootstrap_icon #=> "<i class=\"new-icon\"></i>"
  #    
  #    bootstrap_icon("icon-other", id: "id") #=> "<i class=\"new-other\" id=\"id\"></i>"
  #
  # call-seq:
  #    bootstrap_icon(icon_name = "icon-home", options = {}) => String
  
  def bootstrap_icon(icon_name = "icon-home", options = {})
    name = options[:name] # Remove name from list and return its value
    content_tag(name || :i , nil, {class: icon_name}.merge(options) ) # Return
  end
end