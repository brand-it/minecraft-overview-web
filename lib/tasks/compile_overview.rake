namespace :compile do
  desc "Compile Overview"
  task :overview => :environment do
    command = "#{Rails.root}/lib/tasks/overview_generator/setup.py build"
    output = `#{command.to_s}`
    puts output
  end
end