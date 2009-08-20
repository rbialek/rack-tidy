$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'rack/tidy'
require 'rack/mock'

class Test::Unit::TestCase
end
