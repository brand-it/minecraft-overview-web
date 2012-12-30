
namespace :generate do
  desc "Generate Overview Map"
  task :maps => :environment do
    config_path = "#{Rails.root}/lib/tasks/overview_generator/config.py"
    command = "#{Rails.root}/lib/tasks/overview_generator/overviewer.py --config=#{config_path} && rm -rf ./public/index.html"
    output = `#{command.to_s}`
    puts output
  end
end