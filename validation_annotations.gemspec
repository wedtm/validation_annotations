# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validation_annotations/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Getty Images", "Andy Alm"]
  gem.email         = ["opensourcereview@gettyimages.com"]
  gem.description   = %q{Provides an extensible hook for adding custom html attributes to input elements based on validation rules defined in your model.}
  gem.summary       = gem.description
  gem.homepage      = "http://github.com/gettyimages/validation_annotations"

  gem.files         = Dir['lib/**/*.*'] + Dir['*.gemspec']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "validation_annotations"
  gem.require_paths = ["lib"]
  gem.version       = ValidationAnnotations::VERSION

  gem.add_dependency 'activemodel', '~> 3.2'
  gem.add_dependency 'actionpack', '~> 3.2'
end
