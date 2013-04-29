require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include BootstrapHelper
include ActionView::Helpers

# Add Button class to options
# def add_button_class( options = {} )
#   if options[:class].present?
#     options[:class] = options[:class].lines.to_a << "btn" # => ["something", "btn"]
#     options[:class].join(" ") # => "something btn"
#   else
#     options[:class] = "btn" # => "btn"
#   end
#   options
# end
# 
# def link_to_with_icon(link_name, path, bootstrap_icon = "icon-home", options = {} )
#   link_to path, options do
#     content_tag(:i, nil, class: bootstrap_icon) + link_name
#   end
# end

describe BootstrapHelper do
  describe "#link_to_with_icon" do
    it "it should create a link with a icon" do
      link_to_with_icon("Name", "path").should == ""
    end
  end
  
  describe "#add_button_class" do
    it "should append the 'btn' to the class option" do
      options = {}
      options[:class] = "this is some what happen"
      expect( add_button_class(options) ).to eq({:class=>["this is some what happen", "btn"]})
    end
  end
end