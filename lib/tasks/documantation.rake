doc_path        = "#{Rails.root}/doc"
public_doc_path = "#{public_path}/doc"

namespace :doc do
  task :symlink do
    print "ln -nfs #{doc_path} #{public_doc_path} ... ".yellow
    `ln -nfs #{doc_path} #{public_doc_path}` # Don't need the -nfs but it is a nice extra PLEASE LOOK UP before removing
    puts (File.exists?(doc_path) ? complete_message : failed_message)
  end
end