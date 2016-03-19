# ----------------------------------------------------------------------------
# Frozen-string-literal: true
# Copyright: 2015-2016 Jordon Bedwell - MIT License
# Encoding: utf-8
# ----------------------------------------------------------------------------

$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))
require "extras/version"

Gem::Specification.new do |spec|
  spec.version = Extras::VERSION
  spec.authors = ["Jordon Bedwell"]
  spec.homepage = "http://github.com/envygeeks/extras"
  spec.files = %W(Rakefile Gemfile LICENSE) + Dir["{lib,bin}/**/*"]
  spec.description = "Add some neat little extras into your Ruby stuff."
  spec.summary = "Add neat extras into your Ruby stuff."
  spec.email = ["jordon@envygeeks.io"]
  spec.require_paths = ["lib"]
  spec.has_rdoc = false
  spec.name = "extras"
  spec.license = "MIT"

  spec.add_runtime_dependency "forwardable-extended", "~> 2.5"
end
