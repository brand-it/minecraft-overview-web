module BootstrapHelper
  # Add Button class to options
  def add_button_class( options = {} )
    if options[:class].present?
      options[:class] = options[:class].lines.to_a << "btn" # => ["something", "btn"]
      options[:class].join(" ") # => "something btn"
    else
      options[:class] = "btn" # => "btn"
    end
    options
  end
  
  def link_to_with_icon(link_name, path, bootstrap_icon = "icon-home", options = {} )
    link_to path, options do
      content_tag(:i, nil, class: bootstrap_icon) + link_name
    end
  end
end