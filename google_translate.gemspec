# -*- encoding: utf-8 -*-
require File.expand_path('../lib/google_translate/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Christian Hein"]
  gem.email         = ["chrishein@gmail.com"]
  gem.description   = %q{Simple Ruby Client for Google Translate API}
  gem.summary       = %q{Simple Ruby Client for Google Translate API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "google_translate"
  gem.require_paths = ["lib"]
  gem.version       = GoogleTranslate::VERSION
  
  gem.add_dependency 'rest-client'
  gem.add_dependency 'multi_json'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
end
