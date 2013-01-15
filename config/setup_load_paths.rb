if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
  begin
    gems_path = ENV['MY_RUBY_HOME'].split(/@/)[0].sub(/rubies/,'gems')
    ENV['GEM_PATH'] = "ruby-1.9.3-head@minecraft_master --create"
    require 'rvm'
    RVM.use_from_path! File.dirname(File.dirname(__FILE__))
  rescue LoadError
    raise "RVM gem is currently unavailable." + gems_path
  end
end

# If you're not using Bundler at all, remove lines bellow
ENV['BUNDLE_GEMFILE'] = File.expand_path('../Gemfile', File.dirname(__FILE__))
require 'bundler/setup'