require "rack"

class Base
  def self.routes
    @routes ||= Hash.new { |hash, key| hash[key] = {} }
  end

  def self.get(path, &block)
    routes["GET"][path] = block
  end

  def self.post(path, &block)
    routes["POST"][path] = block
  end

  def call(env)
    @request = Rack::Request.new(env)
    block = self.class.routes[@request.request_method][@request.path]
    return Rack::Response.new("Not Found", 404) if block.nil?
    Rack::Response.new block.call
  end
end
