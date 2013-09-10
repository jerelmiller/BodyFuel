source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'haml'
gem 'sorcery'
gem 'jbuilder'
gem 'paperclip'
gem 'paperclip-dropbox'
gem 'squeel'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'will_paginate'


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
  gem 'pg'
  gem 'pry-rails'
  gem 'better_errors'
  # gem 'rack-mini-profiler'
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