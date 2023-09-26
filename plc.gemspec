# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'plc/version'

Gem::Specification.new do |spec|
  spec.name          = 'plc'
  spec.version       = Plc::VERSION
  spec.license = 'MIT'

  spec.authors       = ['Lucas Winningham']
  spec.email         = ['lucas.winningham@gmail.com']

  spec.summary = 'PLC'
  spec.description = 'PLC'
  spec.homepage = 'https://github.com/lucaswinningham/some_repo'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'byebug', '~> 11.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.8'

  # spec.add_dependency 'activesupport', '~> 6.0'
end
