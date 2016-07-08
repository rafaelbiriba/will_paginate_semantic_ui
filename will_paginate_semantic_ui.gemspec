# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'will_paginate_semantic_ui/version'

Gem::Specification.new do |spec|
  spec.name          = "will_paginate_semantic_ui"
  spec.version       = WillPaginateSemanticUi::VERSION
  spec.authors       = ["Rafael Biriba"]
  spec.email         = ["biribarj@gmail.com"]
  spec.description   = "Integrates the Semantic UI pagination component with will_paginate"
  spec.summary       = "Integrates the Semantic UI pagination component with will_paginate"
  spec.homepage      = "https://github.com/rafaelbiriba/will_paginate_semantic_ui"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/).reject{ |f| f =~ /docs/  }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "will_paginate", "> 3.0.0"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "coveralls"
end
