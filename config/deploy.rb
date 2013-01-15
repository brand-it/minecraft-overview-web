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
  
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy:create_symlink", "config:symlink_database_yml"

namespace :config do
  
  desc "Move database.yml.deploy to config folder"
  task :symlink_database_yml do
    run "rm -rf ~/current/config/database.yml"
    run "rm -rf ~/shared/database.yml"
    run "mv ~/current/config/database.yml.deploy ~/shared/database.yml"
    run "ln -nfs ~/shared/database.yml ~/current/config/database.yml"
  end
end


