require "dolly"

get "/" do
  "Hello World"
end

get "/hello" do
  "Hello #{params['name']}"
end

app = Rack::Builder.new do
  use Rack::Static,
    :urls => ["/images", "/js", "/css"],
    :root => "public"
  run Dolly::Base.new
end

Rack::Server.start app: app, Port: ENV["PORT"] || 8080
