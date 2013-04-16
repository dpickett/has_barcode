# -*- encoding: utf-8 -*-
require File.expand_path('../lib/has_barcode/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Pickett"]
  gem.email         = ["dpickett@enlightsolutions.com"]
  gem.description   = %q{Nice class method wrapper for Barby}
  gem.summary       = %q{Nice class method wrapper for Barby}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "has_barcode"
  gem.require_paths = ["lib"]
  gem.version       = HasBarcode::VERSION
  
  gem.add_dependency("activesupport", [">= 3"])
  gem.add_dependency("i18n")
  gem.add_dependency("barby", [">= 0"])
  gem.add_dependency("rake")
  
  gem.add_development_dependency("rspec", [">= 0"])
  gem.add_development_dependency("chunky_png", [">= 0"])
  gem.add_development_dependency("yard", [">= 0"])
  gem.add_development_dependency("prawn", [">= 0"])
end
