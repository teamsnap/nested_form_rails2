# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "nested_form"
  gem.version       = ActionMailer::VERSION::STRING
  gem.description   = %q{Teamsnap's fork of Nested Form for rails 2.3}
  gem.summary       = %q{Teamsnap's fork of Nested Form for rails 2.3}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
