require "colored"
namespace :compile do
  desc "Check to see if you have the need application for this computer"
  task :doctor do
    python = system("which python")
    if python.blank?
      print "You are missing python would you like download (Y)es (N)o?  ".yellow
      input = STDIN.gets.chomp
      if input == "Y" || input == "y"
        system("open http://www.python.org/ftp/python/2.7.3/python-2.7.3-macosx10.6.dmg")
      elsif input == "N" || input == "n"
        puts "You can download the install you need from this url(http://www.python.org/download/)"
      else
        puts "I only know (N) and (Y) sorry. You can download what you need from http://www.python.org/download/"
      end
      puts "Linux users please run rake install:python:linux"
    else
      puts "Everthing is installed correctly you can now run rake compile:overview:mac".green
    end
  end
  namespace :overview do
    desc "Compile Overview for linux"
    task :linux do
      puts `rake install:pil`
      puts `sudo apt-get install python-imaging`
      puts `sudo apt-get install python-dev`
      puts `sudo apt-get install python-numpy`
      
      puts `sudo ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib`
      puts `sudo ln -s /usr/lib/x86_64-linux-gnu/libfreetype.so /usr/lib`
      puts `sudo ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib`
      
      puts `sudo pip install pillow`
      
      puts `PIL_INCLUDE_DIR=\"#{Rails.root}/tmp/files/Imaging-1.1.7/libImaging\" python #{Rails.root}/lib/tasks/overview_generator/setup.py build`
    end
    desc "Compile Overview for mac"
    task :mac do      
      `rake install:pil`
      
      `python #{Rails.root}/lib/tasks/overview_generator/setup.py clean`
      system("PIL_INCLUDE_DIR=\"#{Rails.root}/tmp/files/Imaging-1.1.7/libImaging\" python #{Rails.root}/lib/tasks/overview_generator/setup.py build")
      `rm -rf #{Rails.root}/tmp/files/Imaging-1.1.7`
      `wget -N http://s3.amazonaws.com/MinecraftDownload/minecraft.jar -P ~/.minecraft/bin/`
    end
  end
end