# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_characters/version'

Gem::Specification.new do |spec|
  spec.name          = "password_characters"
  spec.version       = PasswordCharacters::VERSION
  spec.authors       = ["Nigel Lowry"]
  spec.email         = ["nigel-lowry@ultra.eclipse.co.uk"]

  spec.summary       = %q{Allows you to get characters from a password}
  spec.description   = %q{Can be used to log in to Web sites which ask for specific characters from your password}
  spec.homepage      = "https://github.com/nigel-lowry/password_characters"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 11.2.2"
  spec.add_development_dependency 'aruba', '~> 0.14.1'
  spec.add_development_dependency 'rspec', '~> 3.5.0'
  spec.add_runtime_dependency 'activesupport', '~> 5.0.0.1'
  spec.add_dependency 'thor'
end
