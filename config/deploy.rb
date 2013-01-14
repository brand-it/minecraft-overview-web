require 'rvm/capistrano'
require 'bundler/capistrano'

set :scm, :git
set :application, 'minecraftoverviewweb'
set :repository, "git@github.com:newdark/minecraft-overview-web.git"
set :deploy_via, :copy

set :deploy_to, "/home/rails"
set :user, "rails"
set :use_sudo, false

server "198.61.203.101", :app, :web, :db, :primary => true

namespace :deploy do
  desc "Default deploy - updated to run migrations"
  task :default do
    update_code
    symlink
    restart
  end
end