# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'what_date/version'

Gem::Specification.new do |spec|
  spec.name          = "what_date"
  spec.version       = WhatDate::VERSION
  spec.authors       = ["Edgar"]
  spec.email         = ["zorro.ej@gmail.com"]

  spec.summary       = %q{A simple tool to return the dates given a day}
  spec.description   = %q{This gem tells you the date of next Tuesday, or the second day of May}
  spec.homepage      = "https://github.com/ej2015/what_date.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">=2.3.0"

	spec.add_dependency "activesupport", ">= 4.2"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
	spec.add_development_dependency "pry", "~>0.11"
end
