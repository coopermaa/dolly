require "base"

get "/" do
  "Hello World"
end

post "/" do
  "POST to /"
end

Rack::Server.start app: Dolly::Base.new, Port: ENV["PORT"] || 8080
