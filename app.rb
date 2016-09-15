require "rack"

class Greeter
  def initialize
    @routes = {}
    @routes["/"] = [ 200, {}, ["Hello World"] ]
    @routes["/ruby"] = [ 200, {}, ["Hello Ruby"] ]
  end

  def call(env)
    response = @routes[env["REQUEST_PATH"]]
    return [ 404, {}, ["Not Found"] ] if response.nil?
    response
  end
end

Rack::Server.start app: Greeter.new, Port: ENV["PORT"] || 8080
