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

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/liijunwei/char_detector"
  spec.metadata["changelog_uri"] = "https://github.com/liijunwei/char_detector"

  ignored_files = %w[
    .gitignore
    .ruby-version
    .tool-versions
    bin/console
    bin/setup
    CODE_OF_CONDUCT.md
    LICENSE.txt
    Rakefile
  ]

  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|image|.github)/}) }.reject { |f| ignored_files.include?(f) }
  end

  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.executables   = ["char_detector"]
  spec.require_paths = ["lib"]
end
