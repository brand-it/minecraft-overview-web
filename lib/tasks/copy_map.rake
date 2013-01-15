namespace :map do
  desc "Copy the minecraft map and place it on this server"
  task :copy do
    `mkdir ./tmp/files`
    `ssh mcmyadmin@mcadmin.r3dux.net 'cd ~/mcmyadmin/Minecraft/ && tar -cvf ~/world.tar world && gzip ~/world.tar'`
    puts "logged-in and ran commands"
    `scp mcmyadmin@mcadmin.r3dux.net:~/world.tar.gz ./tmp/files`
  end
  desc "Placed map in the correct path relitive to the information in the config.py"
  task :setup do
    `rake map:copy`
    `mkdir ~/maps`
    `mv ./tmp/files/world.tar.gz ~/maps/world.tar.gz`
    `tar xvf ~/maps/world.tar.gz`
  end
end