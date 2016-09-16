require "rack"

class Base
  class << self
    def routes
      @routes ||= Hash.new { |hash, key| hash[key] = {} }
    end

    %w[GET POST PATCH PUT DELETE HEAD OPTIONS].each do |verb|
      define_method(verb.downcase) do |path, &block|
        routes[verb][path] = block
      end
    end
  end

  def call(env)
    @request = Rack::Request.new(env)
    block = self.class.routes[@request.request_method][@request.path]
    return Rack::Response.new("Not Found", 404) if block.nil?
    Rack::Response.new block.call
  end
end
