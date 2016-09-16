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
    return [ 404, {}, ["Not Found"] ] if block.nil?
    block.call
  end
end
