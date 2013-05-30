# Have not worked this out but this is going to be my task helper spec
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require "#{Rails.root}/lib/tasks/task_helper" # Custom task helper

include TaskHelper
describe TaskHelper do
  describe "#overviewer_config_path" do
    it "should expect a colored in complete message" do
      expect(complete_message).to eq("\e[32mcomplete\e[0m")
    end
  end
end