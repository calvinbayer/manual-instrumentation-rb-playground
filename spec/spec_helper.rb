require 'datadog/ci'

# Configure Datadog Test Optimization
Datadog::CI.configure do |c|
  # Enable test optimization
  c.enabled = true
  
  # Service name for your tests
  c.service = 'ruby-test-project'
  
  # Environment (will be overridden by DD_ENV if set)
  c.env = ENV.fetch('DD_ENV', 'test')
end

RSpec.configure do |config|
  # Use only the new expect syntax
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  # Use only the new mock syntax
  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  # Run specs in random order to surface order dependencies
  config.order = :random
  Kernel.srand config.seed

  # Filter out any pending specs
  config.filter_run_when_matching :focus
end 