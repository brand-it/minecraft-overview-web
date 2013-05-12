namespace :install do
  desc "I can use pupet to install this but it is not worth it to me"
  task :redis do
    puts "rm -rf #{temp_downloads_path}/redis-2.6.13.*"
    `rm -rf #{temp_downloads_path}/redis-2.6.13.*`
    
    puts "cd #{temp_downloads_path} && wget http://redis.googlecode.com/files/redis-2.6.13.tar.gz".yellow
    `cd #{temp_downloads_path} && wget http://redis.googlecode.com/files/redis-2.6.13.tar.gz`
    
    next unless path_exists?("#{temp_downloads_path}/redis-2.6.13.tar.gz")
    
    puts "cd #{temp_downloads_path} && tar xzf redis-2.6.13.tar.gz".yellow
    `cd #{temp_downloads_path} && tar xzf redis-2.6.13.tar.gz`
    
    user_frendly_path_check("#{temp_downloads_path}/redis-2.6.13")
    next unless path_exists?("#{temp_downloads_path}/redis-2.6.13")
    
    `cd #{temp_downloads_path}/redis-2.6.13 && make`
    
    puts `make test`
    
    success_message
  end
end