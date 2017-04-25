# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_reactor_events/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_reactor_events"
  spec.version       = RailsReactorEvents::VERSION
  spec.authors       = ["nbondarenko"]
  spec.email         = ["nataliya.bondarenko17@gmail.com"]

  spec.summary       = "Ruby library for Rails-based apps with events model and logging function"
  spec.description   = "Gem which allows RR events using"
  spec.homepage      = "https://github.com/events/homepage"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TOD: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'pg'

  spec.add_dependency 'orm_adapter', "~> 0.1"
  spec.add_dependency "activesupport"
  spec.add_dependency "activerecord"
end
