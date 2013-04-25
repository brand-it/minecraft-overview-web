source 'https://rubygems.org'

gem 'rails', '>= 3.2.11'

# Development Database
# gem 'sqlite3'
gem "pg" # Database Connection plugin

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'twitter-bootstrap-rails' # Based off of url:http://railscasts.com/episodes/328-twitter-bootstrap-basics
  
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'less-rails' # http://lesscss.org/

  gem 'uglifier', '>= 1.3.0'
end

gem 'jquery-rails'

# This is for terminal colors. It uses ANSI color system. Same one used on mac.
gem 'colored' # url:http://rubydoc.info/gems/colored/1.2/frames

group :production do
  gem 'passenger', '>= 4.0.0.rc4' # Server application
  gem 'sql'
end

group :development do
  # Deploy System
  gem 'capistrano'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.0' # https://github.com/rspec/rspec-rails
  gem 'factory_girl_rails' # https://github.com/thoughtbot/factory_girl
  gem 'ZenTest', '~> 4.4.2'
  gem 'autotest-rails'
end

# group :production do
# 
# end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
