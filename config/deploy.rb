require 'bundler/capistrano'

set :scm, :git
set :application, 'MinecraftOverview'
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
    create_symlink
    restart
  end
end

after "deploy:create_symlink", "config:symlink_database_yml"

namespace :config do
  
  desc "Move database.yml.deploy to config folder"
  task :symlink_database_yml do
    run "rm -rf ~/current/config/database.yml"
    run "mv ~/current/config/database.yml.deploy ~/shared/config/database.yml"
    run "ln -nfs ~/shared/config/database.yml ~/current/config/database.yml"
  end
end


