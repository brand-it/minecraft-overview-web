##
# This is used on all .rake files that are created. These are just general information that you might or need to use on more then
# one rake file.
module TaskHelper
  
  # Complete message in color green
  # 
  # call-seq:
  #   complete_message => \e[32complete\e[0m
  def complete_message
    "complete".green
  end
  
  # Failed message color red
  #
  # call-seq:
  #    failed_message => "\e[31failed\e[0m"
  
  def failed_message
    "failed".red
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
  
  # Home Path starting with the root directory
  #
  #    echo $HOME #=> '/Users/newdark\n'
  #
  # call-seq:
  #    home_path => `echo $HOME`
  
  def home_path
    `echo $HOME`.gsub("\n", "") # This will resolve the absolute path of your home directory
  end
  
  # Shared Path
  #
  #    shared_path #=> '/Users/newdark/shared'
  #
  # call-seq:
  #    shared_path => String
  
  def shared_path
    "#{home_path}/shared"
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
  
  # Check if the path is there and provide a user frendly output to console
  #
  # This is going to return a string of the value that is being send as a puts event
  #
  # call-seq:
  #    user_frendly_path_check("/") => "Checking /.....Found"
  
  def user_frendly_path_check(path)
    unless path.nil?
      checking = "Checking #{path}....."
      response = File.exists?(path) ? "Found".green : "Missing".red
      answer = checking + response    
      puts answer
    else
      puts "Sorry we could not check your path it was nil: #{path}".red
      answer = false
    end
    answer
  end
end