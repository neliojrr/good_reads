
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "good_reads/version"

Gem::Specification.new do |spec|
  spec.name          = "good_reads"
  spec.version       = GoodReads::VERSION
  spec.authors       = ["Nelio Carneiro"]
  spec.email         = ["neliojrr@gmail.com"]

  spec.summary       = %q{ Ruby gem to comunicate with Goodreads API }
  spec.homepage      = "http://nelio.me/good_reads"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
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

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "rest-client", "~> 2.0.2"
  spec.add_runtime_dependency "xml-simple", "~> 1.1.5"
end
