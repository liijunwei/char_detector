require_relative 'lib/char_detector/version'

Gem::Specification.new do |spec|
  spec.name          = "char_detector"
  spec.version       = CharDetector::VERSION
  spec.authors       = ["lijunwei"]
  spec.email         = ["ljw532344863@sina.com"]

  spec.summary       = %q{Initially used for detecting control character in markdown/ruby file.}
  spec.description   = %q{Initially used for detecting control character in markdown/ruby file.}
  spec.homepage      = "https://github.com/liijunwei/char_detector"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/liijunwei/char_detector"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/liijunwei/char_detector"
  spec.metadata["changelog_uri"] = "https://github.com/liijunwei/char_detector"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
