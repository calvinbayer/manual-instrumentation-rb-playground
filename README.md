# Ruby Test Project with Datadog Test Optimization

A simple Ruby project demonstrating test instrumentation with Datadog's Test Optimization library using the datadog-ci gem.

## Requirements

- Ruby 3.2.5
- RSpec 3.13.0
- Datadog CI (Test Optimization) ~1.17.0

## Setup

1. Install Ruby 3.2.5 (using rbenv, rvm, or your preferred Ruby version manager)
2. Install dependencies:
   ```bash
   bundle install
   ```

## Running Tests

Run tests locally:
```bash
bundle exec rspec
```

Or use rake:
```bash
bundle exec rake
```

## Datadog Test Optimization

This project is instrumented with Datadog's Test Optimization library using the `datadog-ci` gem. The gem is configured through environment variables.

### Required Environment Variables for CI:
- `DD_API_KEY`: Your Datadog API key
- `DD_SITE`: Your Datadog site (default: datadoghq.com)

### Optional Environment Variables:
- `DD_APP_KEY`: Your Datadog Application key (for some advanced features)
- `DD_ENV`: Environment name (default: 'test' for tests, 'ci' recommended for CI)
- `DD_SERVICE`: Service name (default: 'ruby-test-project')
- `DD_VERSION`: Version/commit SHA
- `DD_CIVISIBILITY_ENABLED`: Enable CI Visibility (default: 'true')

## CI/CD

The project includes a GitHub Actions workflow that:
- Runs on Linux x86_64 (Ubuntu 22.04)
- Uses Ruby 3.2.5
- Executes tests with Datadog Test Optimization enabled
- Uploads test results to Datadog for analysis

## Project Structure

```
.
├── lib/
│   └── calculator.rb          # Simple calculator class
├── spec/
│   ├── spec_helper.rb         # RSpec configuration with Datadog
│   └── calculator_spec.rb     # Calculator tests
├── .github/workflows/
│   └── test.yml              # GitHub Actions workflow
├── Gemfile                   # Ruby dependencies
├── .ruby-version            # Ruby version specification
└── README.md               # This file
``` 