# Have not worked this out but this is going to be my task helper spec
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

include TaskHelper
describe TaskHelper do
  
end