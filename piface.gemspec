# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'piface/version'

Gem::Specification.new do |spec|
  spec.name          = "piface"
  spec.version       = Piface::VERSION
  spec.authors       = ["Blake Jakopovic"]
  spec.email         = ["blake.jakopovic@gmail.com"]
  spec.description   = %q{Ruby gem for using PiFace Extension Board (and Raspberry Pi)}
  spec.summary       = %q{Ruby Bindings for the pfio.c C Library for use with the PiFace Digital extension board and your Raspberry Pi}
  spec.homepage      = "https://github.com/blakejakopovic/piface"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.extensions    = ['ext/piface/extconf.rb']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "ffi", "~> 1.7"
end
