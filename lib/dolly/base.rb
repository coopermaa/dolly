require "rack"

module Dolly
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

    def params
      @request.params
    end

    def call(env)
      dup.call!(env)
    end

    def call!(env)
      @request = Rack::Request.new(env)
      block = self.class.routes[@request.request_method][@request.path]
      return Rack::Response.new("Not Found", 404) if block.nil?
      Rack::Response.new instance_eval(&block)
    end
  end

  module Delegator
    def self.delegate(methods, to:)
      methods.each(&:downcase!).each do |method_name|
        define_method(method_name) do |*args, &block|
          to.send(method_name, *args, &block)
        end
      end
    end

    delegate %w[GET POST PATCH PUT DELETE HEAD OPTIONS], to: Base
  end
end

# include would include the module in Object
# extend only extends the `main` object
extend Dolly::Delegator
