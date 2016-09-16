require "base"

get "/" do
  "Hello World"
end

post "/" do
  "POST to /"
end

get "/hello" do
  "Hello #{params['name']}"
end

post "/hello" do
  "Hello #{params['name']}"
end

Rack::Server.start app: Dolly::Base.new, Port: ENV["PORT"] || 8080
