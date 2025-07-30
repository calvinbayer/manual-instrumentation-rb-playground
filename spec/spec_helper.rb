require 'datadog/ci'

# Configure Datadog Test Optimization
# The datadog-ci gem is configured primarily through environment variables.
# Set defaults if not already configured via environment variables.
ENV['DD_SERVICE'] ||= 'ruby-test-project'
ENV['DD_ENV'] ||= 'test'

# Enable Datadog CI Visibility
ENV['DD_CIVISIBILITY_ENABLED'] ||= 'true'

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