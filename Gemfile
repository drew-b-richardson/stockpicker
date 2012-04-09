source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mechanize'

#use postgresql on production heroku
group :production do
  gem 'pg'
end

group :development, :test do
  #scaffolding a rails integration with haml on views
  gem 'haml-rails'

  gem 'sqlite3'
  #when you run the annotate command it will show comments on what fields are included in active record model
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'

  #debug and test only use sqlite and debug capabilities
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'

  #rspec
  gem 'rspec-rails'

  #cucmber tests with web steps
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'therubyracer'
end

gem 'jquery-rails'
#gem 'prototype-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

