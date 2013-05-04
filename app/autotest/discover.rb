unless Rails.env.prodution?
  Autotest::Growl::clear_terminal = false

  Autotest.add_hook :initialize do |at|

    %w{.git .hg .DS_Store ._* vendor}.each {|exception| at.add_exception(exception) }
    # Gemfile.lock is causing cucumber to run infinitely. Don't watch it.
      at.add_exception(%r{^\./Gemfile.lock})
  
    at.add_mapping(%r%^spec/acceptance/.*_spec.rb$%, true) { |filename, _|
      filename
    }

    at.add_mapping(%r%^app/(models|controllers|helpers|lib)/.*rb$%, true) {
      at.files_matching %r%^spec/acceptance/.*_spec.rb$%
    }

    at.add_mapping(%r%^app/views/(.*)$%, true) {
      at.files_matching %r%^spec/acceptance/.*_spec.rb$%
    }
  end
end # unless Rails.env.prodution?