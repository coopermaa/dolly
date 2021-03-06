# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dolly/version'

Gem::Specification.new do |spec|
  spec.name          = "dolly"
  spec.version       = Dolly::VERSION
  spec.authors       = ["Cooper Maa"]
  spec.email         = ["coopermaa77@gmail.com"]

  spec.summary       = %q{Minimal micro framework inspired by Sinatra.}

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 3.0"
  spec.add_development_dependency "rack-test"
end
