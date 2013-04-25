require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include ApplicationHelper
include ActionView::Helpers
describe ApplicationHelper do
  describe "#overviewer_config_path" do
    it "should give the string to the path of the overview_config" do
      overviewer_config_path.should == 'javascript/overviewerConfig.js'
    end
  end
  
  describe "#google_api_maps_path" do
    it "should get the url of google api maps" do
      google_api_maps_path.should == "http://maps.google.com/maps/api/js?sensor=false"
    end
  end
  
  describe "#javascript_google_maps_content_tag" do
    it "should create a script with a src and a type that is text/javascript" do
      javascript_google_maps_content_tag.should == "<script src=\"http://maps.google.com/maps/api/js?sensor=false\" type=\"text/javascript\"></script>"
    end
  end
  
  describe "#javascript_overviewer_config_content_tag" do
    it "should not create a new content tag and return nil" do
      javascript_overviewer_config_content_tag.should == nil
    end
    
    it "should create a new content tag and type as javascript" do
      File.stub(:exist?).and_return(true)
      javascript_overviewer_config_content_tag.should == "<script src=\"javascript/overviewerConfig.js\" type=\"text/javascript\"></script>"
    end
  end
end