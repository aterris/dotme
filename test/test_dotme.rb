require 'rubygems'
require 'bundler'

Bundler.require

require 'dotme'

require 'test/unit'
require 'rack/test'

class DotmeTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/'
    assert last_response.ok?
  end
end
