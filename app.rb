require "base"

class Greeter < Base
  get "/" do
    "Hello World"
  end

  post "/" do
    "POST to /"
  end
end

Rack::Server.start app: Greeter.new, Port: ENV["PORT"] || 8080
