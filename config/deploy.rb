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

# :current_path - 'current' symlink pointing at current release
# :release_path - 'release' directory being deployed
# :shared_path - 'shared' directory with shared content

after "deploy:setup", "deploy:prepare_shared"

desc "This is used for deploying"
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

after "deploy:cold", "cold:prepare_shared"

desc "This is used for cold deploying"
namespace :cold do
  desc "Setup some no standard shared folders"
  task :prepare_shared do
    `rake setup:cold`
  end
end

after "deploy:create_symlink", "config:symlink_database_yml", "config:symlink_overview"

desc "This is used to config that deploy after deploy"
namespace :config do
  
  desc "Move database.yml.deploy to config folder"
  task :symlink_database_yml do
    run "rm -rf #{current_path}/config/database.yml"
    run "rm -rf #{shared_path}/database.yml"
    run "mv #{current_path}/config/database.yml.deploy #{shared_path}/database.yml"
    run "ln -nfs #{shared_path}/database.yml #{current_path}/config/database.yml"
  end
  
  desc "Create system links for maps and for javascript"
  task :symlink_overview do
    puts `cd #{current_path} && rake setup:paths:symlink`
    puts `cd #{current_path} && rake doctor:who`
  end
end


