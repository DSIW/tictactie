# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tictactie/version'

Gem::Specification.new do |spec|
  spec.name          = "tictactie"
  spec.version       = TicTacTie::VERSION
  spec.authors       = ["DSIW"]
  spec.email         = ["dsiw@dsiw-it.de"]

  spec.summary       = %q{Refactor tictactie.}
  spec.description   = %q{Refactor tictactie from old script found on stackoverflow.}
  spec.homepage      = "https://github.com/DSIW/tictactie"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rubocop', '~> 0.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.1'
  spec.add_development_dependency 'simplecov', '~> 0.9'

  spec.add_dependency "colored", "~> 1.2"
end
