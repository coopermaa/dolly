require "rack"

class Base
  def self.routes
    @routes ||= {}
  end

  def self.get(path, &block)
    routes[path] = block
  end

  def call(env)
    block = self.class.routes[env["REQUEST_PATH"]]
    return Rack::Response.new("Not Found", 404) if block.nil?
    Rack::Response.new block.call
  end
end
