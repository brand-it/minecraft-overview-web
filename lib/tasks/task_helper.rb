##
# This is used on all .rake files that are created. These are just general information that you might or need to use on more then
# one rake file.
module TaskHelper
  
  # Complete message in color green
  # 
  # call-seq:
  #    complete_message => \e[32complete\e[0m
  #    complete_message(complete: "happy") => \e[32happy\e[0m
  
  def complete_message(complete: "complete")
    "#{complete}".green
  end
  
  # Failed message color red
  #
  # call-seq:
  #    failed_message => "\e[31failed\e[0m"
  #    failed_message(failed: "sad") => \e[32sad\e[0m
  
  def failed_message(failed: "failed")
    "#{failed}".red
  end
  
  # Success message
  #
  # call-seq:
  #    success_message => "\e[32Task has been completed\e[0m"
  
  def success_message
    "Task has been completed".green
  end
  
  # Error message
  #
  # call-seq:
  #    error_message => "\e[31Task could not be completed\e[0m"
  
  def error_message
    "Task could not be completed".red
  end
  
  # This is where we can store all are downloads that we want to install or run with this application.
  # 
  # call-seq:
  #    temp_downloads_path => String
  
  def temp_downloads_path       
    "#{Rails.root}/tmp/downloads" # These are all the files downloaded
  end
  
  # Home Path starting with the root directory,. This is for th
  #
  #    echo $HOME #=> '/Users/newdark\n'
  #
  # call-seq:
  #    user_home_path => `echo $HOME`
  
  def user_home_path
    `echo $HOME`.gsub("\n", "") # This will resolve the absolute path of your home directory
  end
  
  # Shared Path
  #
  #    shared_path #=> '/Users/newdark/shared'
  #
  # call-seq:
  #    shared_path => String
  
  def shared_path
    "#{user_home_path}/shared"
  end
  
  # Shared Public Path
  #
  #    shared_public_path #=> '/Users/newdark/public'
  # 
  # call-seq:
  #    shared_public_path => String
  
  def shared_public_path
    "#{shared_path}/public"
  end
  
  # Rails Root Public Path
  # 
  # call-seq:
  #    shared_public_path => '#{Rails.root}/public'
  
  def public_path
    "#{Rails.root}/public"
  end
  
  # This is a simple true false method nothing more or less
  # If some sort of condition is not considered it will return false
  # Meaning if we for some reason have a problem With the File exists method we will return false
  #
  # call-seq:
  #    path_exists?(String) => Boolean
  
  def path_exists?(path)
    return false if path.nil?
    return true if File.exists?(path)
    false
  end
  
  # Check if the path is there and provide a user frendly output to console
  #
  # This is going to return a string of the value that is being send as a puts event
  #
  # call-seq:
  #    user_frendly_path_check(String) => "Checking /.....Found"
  
  def user_frendly_path_check(path, found: "Found", missing: "Missing")
      checking = "Checking #{path}....."
      response = path_exists?(path) ? "#{found}".green : "#{missing}".red
      answer = checking + response    
      puts answer
      answer # => String
  end
end