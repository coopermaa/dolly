require_relative "my_app"
require "minitest/autorun"
require "rack/test"

describe Dolly do
  include Rack::Test::Methods
    
  def app  
    Dolly::Base.new
  end
    
  it "says Hello" do
    get '/'
    last_response.status.must_equal 200
    last_response.body.must_equal 'Hello World'
  end
  
  it "says Hello HTTP POST" do
    post '/'
    last_response.status.must_equal 200
    last_response.body.must_equal 'Hello HTTP POST'
  end

  it "says Hello Ruby" do
    get '/hello?name=Ruby'
    last_response.status.must_equal 200
    last_response.body.must_equal 'Hello Ruby'
  end

  it "says Hello Dolly" do
    post '/hello', :name => "Dolly"
    last_response.status.must_equal 200
    last_response.body.must_equal 'Hello Dolly'
  end

  it "says not found" do
    get '/non_existent_url'
    last_response.status.must_equal 404
    last_response.body.must_include 'Not Found'
  end
end
