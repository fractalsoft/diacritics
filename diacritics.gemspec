# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'diacritics/version'

Gem::Specification.new do |spec|
  spec.name          = 'diacritics'
  spec.version       = Diacritics::VERSION
  spec.authors       = [
    'Alex Malaszkiewicz',
    'Agnieszka Matysek',
    'François Vantomme',
  ]
  spec.email         = ['info[at]fractalsoft[dot]org']
  spec.summary       = 'Support diacritics'
  spec.description   = 'Support diacritics in String'
  spec.homepage      = 'https://github.com/fractalsoft/diacritics'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 0'
end
