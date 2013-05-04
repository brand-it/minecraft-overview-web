require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include ApplicationHelper
describe ApplicationHelper do
  describe "#overviewer_config_path" do
    it "should give the string to the path of the overview_config" do
      expect( overviewer_config_path ).to eq('javascript/overviewerConfig.js')
    end
  end
  
  describe "google_maps_url" do
    it "should return to google" do
      expect( google_maps_url ).to eq('http://maps.google.com')
    end
  end
  
  describe "#google_api_maps_path" do
    # Use helper here so we can stub out methods
    it "should get the url of google api maps" do
      helper.stub(:google_maps_url) { 'google_url' }
      expect( helper.google_api_maps_path ).to eq('google_url/maps/api/js?sensor=false')
    end
  end
  
  describe "#javascript_google_maps_content_tag" do
    it "should create a script with a src and a type that is text/javascript" do
      expect( javascript_google_maps_content_tag ).to eq("<script src=\"http://maps.google.com/maps/api/js?sensor=false\" type=\"text/javascript\"></script>")
    end
    
    it "should have some extra options" do
      expect( javascript_google_maps_content_tag(async: 'async') ).to eq("<script async=\"async\" src=\"http://maps.google.com/maps/api/js?sensor=false\" type=\"text/javascript\"></script>")
    end
  end
  
  describe "#javascript_overviewer_config_content_tag" do
    it "should create a new content tag and type as javascript" do
      File.stub(:exist?).and_return(true)
      expect( javascript_overviewer_config_content_tag ).to eq("<script src=\"javascript/overviewerConfig.js\" type=\"text/javascript\"></script>")
    end
  end
end