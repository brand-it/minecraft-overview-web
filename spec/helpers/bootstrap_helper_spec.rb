require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include BootstrapHelper
describe BootstrapHelper do
  
  describe "#bootstrap_icon" do
    it "should generate the content tags needed for bootstrap icons with default" do
      expect(bootstrap_icon).to eq("<i class=\"icon-home\"></i>")
    end
    
    it "should create a content tag with a diffrent type of icon" do
      expect(bootstrap_icon("new-icon")).to eq("<i class=\"new-icon\"></i>")
    end
    
    it "should create a content tag with a diffrent type of icon and a cool id" do
      expect( bootstrap_icon("new-icon", id: "id") ).to eq("<i class=\"new-icon\" id=\"id\"></i>")
    end
  end
end