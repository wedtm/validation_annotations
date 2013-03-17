# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validation_annotations/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["TODO: Write your name"]
  gem.email         = ["TODO: Write your email address"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "validation_annotations"
  gem.require_paths = ["lib"]
  gem.version       = ValidationAnnotations::VERSION

  gem.add_dependency 'actionpack', '~> 3.2'
end
