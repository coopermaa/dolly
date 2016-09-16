require "base"

class Greeter < Base
  get "/" do
    "Hello World"
  end

  get "/ruby" do
    "Hello Ruby"
  end
end

Rack::Server.start app: Greeter.new, Port: ENV["PORT"] || 8080
