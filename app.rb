require "rack"

class Greeter
  @routes = {}                # class instance variable
  @routes["/"] = [ 200, {}, ["Hello World"] ]
  @routes["/ruby"] = [ 200, {}, ["Hello Ruby"] ]

  def self.routes
    @routes
  end

  def call(env)
    response = self.class.routes[env["REQUEST_PATH"]]
    return [ 404, {}, ["Not Found"] ] if response.nil?
    response
  end
end

Rack::Server.start app: Greeter.new, Port: ENV["PORT"] || 8080
