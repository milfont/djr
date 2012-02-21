# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "djr/version"

Gem::Specification.new do |s|
  s.name        = "djr"
  s.version     = Djr::VERSION
  s.authors     = ["Christiano Milfont"]
  s.email       = ["cmilfont@gmail.com"]
  s.homepage    = "https://github.com/milfont/djr"
  s.summary     = %q{Direct Jquery Remoting}
  s.description = %q{DJR will generate the JavaScript code from Rails Controllers to allow browsers to securely call into Ruby code almost as if it was running locally}

  s.rubyforge_project = "djr"

  #s.files         = `git ls-files`.split("\n")
  s.files         = ['Gemfile', 'Rakefile', 'app/controllers/djr_controller.rb', 'config/routes.rb', 'djr.gemspec', 'lib/djr.rb',
                      'lib/djr/version.rb', 'lib/engine.rb', 'vendor/assets/javascripts/djr.js']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('railties', '>= 3.1.0')

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end