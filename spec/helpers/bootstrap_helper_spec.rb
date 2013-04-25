require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include BootstrapHelper
include ActionView::Helpers

describe BootstrapHelper do
  describe "#link_to_with_icon" do
    it "does something"
  end
  
  
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
  describe "#add_button_class" do
    it "should append the 'btn' to the class option" do
      options = {}
      options[:class] = "this is some what happen"
      expect( add_button_class(options) ).to eq({:class=>["this is some what happen", "btn"]})
    end
  end
end