# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'youtrack/version'

Gem::Specification.new do |gem|
  gem.name          = "youtrack-client"
  gem.version       = Youtrack::VERSION
  gem.authors       = ["Shane Hofstetter"]
  gem.email         = ["shane.hofstetter@gmail.com"]
  gem.description   = %q{REST API client for youtrack from jetbrains}
  gem.summary       = %q{youtrack REST API client}
  gem.homepage      = "https://github.com/shanehofstetter/youtrack-rest-client-ruby"
  gem.metadata["homepage_uri"] = gem.homepage
  gem.metadata["source_code_uri"] = "https://github.com/shanehofstetter/youtrack-rest-client-ruby"
  gem.metadata["changelog_uri"] = "https://github.com/shanehofstetter/youtrack-rest-client-ruby/blob/main/CHANGELOG.md"
  gem.metadata["bug_tracker_uri"] = "https://github.com/shanehofstetter/youtrack-rest-client-ruby/issues"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.required_ruby_version = Gem::Requirement.new(">= 2.1.0")
  gem.require_paths = ["lib"]

  gem.add_dependency "rest-client"
  gem.add_dependency "activesupport"
  gem.add_dependency "zeitwerk"
end
