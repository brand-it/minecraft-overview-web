
namespace :generate do
  desc "Generate Overview Map"
  task :maps => :environment do
    `mkdir ~/current/public/javascript`
    config_path = "#{Rails.root}/lib/tasks/overview_generator/config.py"
    output = `python #{Rails.root}/lib/tasks/overview_generator/overviewer.py --config=#{config_path} && rm -rf ~/current/public/index.html`
    puts output
  end
end