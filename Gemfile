source 'https://rubygems.org'

# Rails
gem 'rails', '3.2.13'

# Backend Database, nothing heavy
gem 'sqlite3'

# Screw erb
gem 'haml-rails'

# Standard Jquery-rails
gem 'jquery-rails'

# Authentication using omniauth
gem 'omniauth'
gem 'omniauth-google-oauth2'

group :assets do

  # Sass and Coffee script
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # Javascript runtime built in ruby for compilation
  gem 'therubyracer', :platforms => :ruby

  # Meh
  gem 'uglifier', '>= 1.0.3'
end

group :test do

  # Test framework
  gem 'gherkin'
  gem 'cucumber-rails', :require => false
  gem 'rspec-rails'
  gem 'database_cleaner'
end

group :development do

  # Thin web server
  gem 'thin'

  # Load tests quickly
  gem 'spork'

  # Run tests automatically
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-cucumber'
  gem 'guard-spork'
  gem 'guard-bundler'

  # To help notice changes in files
  gem 'rb-inotify', '~> 0.9', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end

group :test, :development do
  # Helps with automatic creation of factories
  gem 'factory_girl_rails'
end
