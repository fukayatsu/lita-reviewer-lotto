# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lita/reviewer/lotto/version'

Gem::Specification.new do |spec|
  spec.name          = "lita-reviewer-lotto"
  spec.version       = Lita::Reviewer::Lotto::VERSION
  spec.authors       = ["fukayatsu"]
  spec.email         = ["fukayatsu@gmail.com"]
  spec.summary       = %q{A reviewer lottery script for Lita}
  spec.description   = %q{A reviewer lottery script for Lita}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 2.0"
  spec.add_runtime_dependency 'octokit', '~> 3.1.0'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
