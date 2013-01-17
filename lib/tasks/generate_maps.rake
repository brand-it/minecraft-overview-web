
namespace :generate do
  desc "Generate Overview Map"
  task :maps => :environment do
    config_path = "#{Rails.root}/lib/tasks/overview_generator/config.py"
    puts `sudo python #{Rails.root}/lib/tasks/overview_generator/overviewer.py --config=#{config_path} && rm -rf ./public/index.html`
  end
end