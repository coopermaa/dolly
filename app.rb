require "base"

class Greeter < Base
  get "/" do
    [ 200, {}, ["Hello World"] ]
  end

  get "/ruby" do
    [ 200, {}, ["Hello Ruby"] ]
  end
end

Rack::Server.start app: Greeter.new, Port: ENV["PORT"] || 8080
