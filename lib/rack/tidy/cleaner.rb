require 'tidy'

module Rack::Tidy
  # This class is the interface between Rack and the Tidy gem
  class Cleaner
    
    # Defaults for the Tidy gem config
    DEFAULT_TIDY_OPTS = {
      'char-encoding'     => 'utf8',
      'indent'            => true,
      'indent-spaces'     => 2,
      'tidy-mark'         => false,
      'wrap'              => 0 }
          
    # Tidy gem options, see http://tidy.sourceforge.net/docs/quickref.html
    attr_accessor :tidy_options
    
    # Paths to be ignored during Rack::Tidy processing
    attr_accessor :ignore_paths
                
    def initialize(app, options = {})
      ::Tidy.path = TIDY_LIB
      @app = app
      self.ignore_paths = options[:ignore_paths] || []
      self.tidy_options = DEFAULT_TIDY_OPTS.merge(options)
    end
    
    # method required by Rack interface
    def call(env)
      call! env
    end

    # thread safe version using shallow copy of env
    def call!(env)
      @env = env.dup
      status, @headers, response = @app.call(@env)      
      if should_clean?
        @headers.delete('Content-Length')
        response = Rack::Response.new(
          tidy_markup(response.respond_to?(:body) ? response.body : response),
          status,
          @headers
        )
        response.finish
        response.to_a
      else
        [status, @headers, response]
      end
    end
    
    private
              
      def should_clean? #:nodoc:
        @headers["Content-Type"] && 
        @headers["Content-Type"].include?("text/html") &&         
        self.ignore_paths.none? { |p| @env["PATH_INFO"].start_with?(p) }
      end
      
      def tidy_markup(content) #:nodoc:
        ::Tidy.open(self.tidy_options) { |tidy| tidy.clean(content) }
      end
  end
end
