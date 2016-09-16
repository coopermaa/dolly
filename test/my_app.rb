require "dolly"

get "/" do
  "Hello World"
end

post "/" do
  "Hello HTTP POST"
end

get "/hello" do
  "Hello #{params['name']}"
end

post "/hello" do
  "Hello #{params['name']}"
end
