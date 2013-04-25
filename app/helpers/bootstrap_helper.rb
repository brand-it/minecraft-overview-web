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
  
  def link_to_with_icon( link_name, path, bootstrap_icon, options = {} )
    content = [ content_tag(:i, nil, class: bootstrap_icon), link_name ] # Order of the Join Change the order to change the join
    options = add_button_class(options).merge(options)
    
    link_to path, options do
      content.join(" ").html_safe
    end
  end
end
  