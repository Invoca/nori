# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nori_savon/version"

Gem::Specification.new do |s|
  s.name        = "nori_savon"
  s.version     = NoriSavon::VERSION
  s.authors     = ["Daniel Harrington", "John Nunemaker", "Wynn Netherland"]
  s.email       = "me@rubiii.com"
  s.homepage    = "http://github.com/rubiii/nori_savon"
  s.summary     = "XML to Hash translator"
  s.description = s.summary

  s.rubyforge_project = "nori_savon"

  s.add_development_dependency "rake",     "~> 0.8.7"
  s.add_development_dependency "nokogiri", ">= 1.4.0"
  s.add_development_dependency "rspec",    "~> 2.5.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
