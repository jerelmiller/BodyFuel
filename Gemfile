source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'haml'
gem 'sorcery'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'angularjs-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'sqlite3'
  gem 'pry-rails'
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'mocha', :require => false
  gem 'factory_girl_rails'
end

group :test do
  gem 'database_cleaner'
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
