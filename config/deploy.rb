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

namespace :config do
  desc "Make symlink for config yml files" 
  task :create_symlink do
    run "ln -nfs #{deploy_to}/config/*.yml #{release_path}/config"
  end
  
  task :create_database_yml do
    desc "Move database.yml.deploy to config folder"
    run "mv #{release_path}/config/database.yml.deploy #{deploy_to}/config/database.yml"
    run "ln -nfs #{release_path}/config/database.yml #{deploy_to}/config/database.yml"
  end
end


