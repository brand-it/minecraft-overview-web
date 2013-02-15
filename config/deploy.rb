require 'bundler/capistrano'
load 'deploy/assets'

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

after "deploy:create_symlink", "config:symlink_database_yml", "config:compile_overview"

namespace :config do
  
  desc "Move database.yml.deploy to config folder"
  task :symlink_database_yml do
    run "rm -rf ~/current/config/database.yml"
    run "rm -rf ~/shared/database.yml"
    run "mv ~/current/config/database.yml.deploy ~/shared/database.yml"
    run "ln -nfs ~/shared/database.yml ~/current/config/database.yml"
    run "ln -nfs ~/maps ~/current/public/maps"
    run "ln -nfs ~/javascript ~/current/public/javascript"
  end
  
  desc "Generate or build the the overview_generator needed if you want to generate a map"
  task :compile_overview do
    run "PIL_INCLUDE_DIR=\"~/Imaging-1.1.7/libImaging\" python ~/current/lib/tasks/overview_generator/setup.py build"
  end
end


