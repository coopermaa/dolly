# dolly

Minimal micro framework inspired by Sinatra.

## Usage

Here is a simple application:

```ruby
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

Rack::Server.start app: Dolly::Base.new, Port: ENV["PORT"] || 8080
```

The example application is located at **examples/app.rb**, to run it:

```
git clone https://github.com/coopermaa/dolly.git
cd dolly
ruby -Ilib examples/app.rb
```

## Note

There is already a Ruby gem called [dolly](https://github.com/amco/dolly) (Object-Oriented interface for CouchDB), so I didn't push my gem to Rubygems.
To use this micro framework, please use source code directly.
