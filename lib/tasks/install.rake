namespace :install do
  desc "Setup PIL for MAC or LINUX"
  task :pil do
    puts `mkdir ./tmp/files`
    puts `cd ./tmp/files/ && curl -O -L http://effbot.org/downloads/Imaging-1.1.7.tar.gz`
    puts `cd ./tmp/files/ && tar -xzf Imaging-1.1.7.tar.gz`
    puts `sudo python ./tmp/files/Imaging-1.1.7/setup.py clean`
    puts `sudo python ./tmp/files/Imaging-1.1.7/setup.py build`
    puts `sudo python ./tmp/files/Imaging-1.1.7/setup.py install`
    puts `rm -rf ./tmp/files/Imaging-1.1.7.tar.gz`
  end
  
  task :zlib do
    `cd ./tmp/files/ && curl -O -L http://zlib.net/zlib-1.2.5.tar.gz`
    `tar -xvf ./tmp/files/zlib-1.2.5.tar.gz`
  end
  
  namespace :unix do
    desc "Fix error: command 'gcc' failed with exit status 1"
    task :python_doctor do
      `sudo apt-get install python-dev`
      `sudo apt-get install libevent-dev`
      `sudo apt-get install python-numpy`
      `sudo apt-get install python-scipy`
    end
  end

end