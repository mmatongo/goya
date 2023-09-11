# goya.gemspec

Gem::Specification.new do |spec|
  spec.name          = "goya"
  spec.version       = "0.1.0"
  spec.authors       = ["Daniel M. Matongo"]
  spec.email         = ["mmatongo_@hotmail.com"]

  spec.summary       = "A minimal web framework for Raspberry Pi Zero W"
  spec.description   = "Goya is a lightweight web framework designed to run on low-resource environments like the Raspberry Pi Zero W."
  spec.homepage      = "URL_TO_YOUR_PROJECT_HOMEPAGE"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_runtime_dependency "erb", "~> 2.2", ">= 2.2.1"
  spec.add_runtime_dependency "sqlite3", "~> 1.4"
end
