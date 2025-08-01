FROM ruby:3.2.5-alpine

# Install only essential build dependencies (no git)
RUN apk add --no-cache \
    build-base \
    tzdata

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock first for better Docker layer caching
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle config set --local deployment 'true' && \
    bundle install

# Copy application code
COPY . .

# Create output directory for test results
RUN mkdir -p /tmp

# Default command runs the tests with JUnit output
CMD ["bundle", "exec", "rspec", "--no-color", "-r", "yarjuf", "--format", "JUnit", "--out", "/tmp/rspec.xml"] 