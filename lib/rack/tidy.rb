require 'rack'

# = Tidy Markup Cleaner for Rack
#
# Rack::Tidy cleans text/html markup by automatically 
# indenting and reformatting content. Best results are achieved 
# with valid markup, when you simply want to use this component 
# to produce clean (X)HTML rendered by templating systems such as ERb.
#
# Rack::Tidy relies on the power of the Tidy gem and defaults to settings
# based on convention. However, you can override these through configuration.
#
# === Usage
#
# Within a rackup file (or with Rack::Builder):
#   require 'rack/tidy'
#   use Rack::Tidy,
#     :ignore_paths => ['/admin', '/cms'],
#     'indent-spaces' => 4
#   run app
#
# Rails example:
#   # above Rails::Initializer block
#   require 'rack/tidy'
#
#   # inside Rails::Initializer block 
#   config.middleware.use Rack::Tidy,
#     :ignore_paths => ['/admin', '/cms'],
#     'indent-spaces' => 4
module Rack::Tidy
  autoload :Cleaner, 'rack/tidy/cleaner'
  

  # look for libtidy lib in different OSes
  def self.find_libtidy_path
    [ "/usr/lib64/libtidy.so",    # CentOs 64bit
      "/usr/lib/libtidy.so",      # CentOs/Fedora
      "/usr/lib/tidylib.so",     # (Ubuntu)
      "/usr/lib/libtidy.A.dylib", # MacOS / default
    ].each{|p|
      if File.exist?(p) 
        puts "Found libtidy in: #{p}"
        return p         
      end
    }
    puts "rack-tidy couldn't find the libtidy library in your system"
    puts "Run:  yum install libtidy-devel on Fedora/CentOS"
    raise "libtidy NOT FOUND!"
  end
  
  
  # Specify path of Tidy library, e.g.
  #   "/usr/lib/libtidy.A.dylib" (Mac; also the default if not set)
  #   "/usr/lib/tidylib.so" (Ubuntu)
  #   "/usr/lib/libtidy-0.99.so.0" (Fedora/CentOS)
  TIDY_LIB = defined?(::TIDY_LIB) ? ::TIDY_LIB : find_libtidy_path
  
  # Create a new Rack::Tidy middleware component that cleans text/html markup
  # using the Tidy gem. The +options+ Hash can be used to specify which paths
  # should be ignored during processing as well as Tidy gem configuration values. 
  # See Cleaner for defaults and http://tidy.sourceforge.net/docs/quickref.html 
  # for more options
  def self.new(backend, options = {})
    Cleaner.new(backend, options)
  end
end