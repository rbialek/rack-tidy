require 'test_helper'
require 'rack_tidy_sample_data'

class RackTidyTest < Test::Unit::TestCase
  include RackTidySampleData
  
  def get_response(path, body, content_type = 'text/html', options = {})
    app = Rack::Builder.new do
      use Rack::Tidy, options
      run lambda { |env| [200, {'Content-Type' => content_type}, [body] ] }
    end
    Rack::MockRequest.new(app).get(path)
  end
    
  context "Rack::Tidy" do  
    context "with content type equal to 'text/html'" do
      setup do
        @response = get_response('/', DIRTY_HTML)
      end
      should "clean response body" do
        assert_equal CLEAN_HTML, @response.body
      end
            
      context "with ignore paths containing one item that matches current path" do        
        setup do 
          @response = get_response('/cms', DIRTY_HTML, 'text/html', :ignore_paths => '/cms')
        end
        should "not clean response body" do
          assert_equal DIRTY_HTML, @response.body
        end        
      end
      
      context "with ignore paths containing array of items with one matching current path" do
        setup do
          @response = get_response('/cms',
            DIRTY_HTML, 
            'text/html', 
            :ignore_paths => ['/admin', '/cms'])
        end
        should "not clean response body" do
          assert_equal DIRTY_HTML, @response.body
        end
      end
      
      context "with ignore paths containing array of items that don't match current path" do
        setup do
          @response = get_response('/',
            DIRTY_HTML, 
            'text/html', 
            :ignore_paths => ['/admin', '/cms'])
        end
        should "clean response body" do
          assert_equal CLEAN_HTML, @response.body
        end
      end
          
      context "with 'indent-spaces' set to 4" do
        setup do
          @response = get_response('/',
            DIRTY_HTML, 
            'text/html', 
            'indent-spaces' => 4)
        end

        should "clean response body, indenting with 4 spaces" do
          assert_equal CLEAN_HTML_WITH_4_SPACE_INDENTS, @response.body
        end
      end
    end
    
    context "with content type equal to 'text/css'" do
      setup do
        @response = get_response('/', CSS, 'text/css')
      end
      should "not clean response body" do
        assert_equal CSS, @response.body
      end
    end
    
    context "with content type equal to 'application/javascript'" do
      setup do        
        @response = get_response('/', JS, 'application/javascript')
      end
      should "not clean response body" do
        assert_equal JS, @response.body
      end
    end
  
    context "with ignore path set and multiple requests" do
      setup do
        app = Rack::Builder.new do
          use Rack::Tidy, :ignore_paths => '/cms'
          run lambda { |env| [200, {'Content-Type' => 'text/html'}, [DIRTY_HTML] ] }
        end
        Rack::MockRequest.new(app).get('/')
        @response = Rack::MockRequest.new(app).get('/cms')
      end
      should "not clean response body" do
        assert_equal DIRTY_HTML, @response.body
      end
    end
  end
end