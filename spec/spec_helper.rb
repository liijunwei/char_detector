if ENV.fetch('COVERAGE', 'f').start_with? 't'
  require 'simplecov'
  SimpleCov.start
end

require "bundler/setup"
require "pry"
require "char_detector"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
