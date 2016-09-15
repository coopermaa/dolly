require "rack"

class Greeter
  def call(env)
    case env["REQUEST_PATH"]
    when "/" then [ 200, {}, ["Hello World"] ]
    when "/ruby" then [ 200, {}, ["Hello Ruby"] ]
    else
      [ 200, {}, ["Not Found"] ]
    end
  end
end

Rack::Server.start app: Greeter.new, Port: ENV["PORT"] || 8080
