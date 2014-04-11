# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tenses/version'

Gem::Specification.new do |spec|
  spec.name          = "tenses"
  spec.version       = Tenses::VERSION
  spec.authors       = ["Daniel Myasnikov"]
  spec.email         = ["info@danielmyasnikov.com"]
  spec.summary       = %q{Nifty way to create a past present and future tenses.}
  spec.description   = %q{Create a future past and present tenses with this gem by just adding the tense and options to your verbs.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "verbs"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
