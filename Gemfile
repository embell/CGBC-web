source 'https://rubygems.org'

ruby '2.5.7'

gem 'rails', '~> 4.2.11'
gem 'nokogiri', '~>1.11.4'

# Fix the conflict with the system 'rake':
gem 'rake', '~> 12.3.3'

# Support for databases and environment.
# Use 'sqlite3' for testing and development and mysql and postgresql
# for production.

group :development, :test do
  gem 'sqlite3', '~> 1.3.11'
  gem 'rspec-rails'
  gem 'byebug'
  gem 'better_errors'
  gem 'factory_bot_rails', '~> 4.9'
  gem 'minitest'
  gem 'thor'
end

group :test do
  gem 'simplecov', :require => false
  gem 'database_cleaner'
end

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development do
  gem 'spring'
end

group :production, :postgresql do
  gem 'pg', '~> 0.20'
  gem 'unicorn'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
gem 'coffee-script-source', '1.8.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.4'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
group :doc do
  gem 'sdoc', '~> 0.4.0'
end

gem 'haml'
gem 'devise', '~> 4.7.1'
gem 'carrierwave'
gem 'pericope'
gem 'will_paginate'

gem 'tzinfo-data'
