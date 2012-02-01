# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "xcoder-cedar"
  s.version     = 0.1
  s.authors     = ["Franklin Webber"]
  s.email       = ["franklin.webber@gmail.com"]
  s.homepage    = "https://github.com/burtlo/xcoder-cedar"
  s.summary     = %q{Provides a Cedar Builder task for the Xcoder gem}
  s.description = %q{Provides the ability to run Cedar test suite for the targets that support it.}

  s.rubyforge_project = "xcoder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = []
  s.executables   = []
  s.require_paths = ["lib"]
end
