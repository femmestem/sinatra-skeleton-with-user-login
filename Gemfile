source 'https://rubygems.org'

gem 'rake'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-partial'

# Use Thin as web server
gem 'thin'

# Detect changes and automatically reload web server
gem 'shotgun'

# Use PostgreSQL database
gem 'pg'

# Use ActiveRecord object relational map
gem 'activerecord'
gem 'activesupport'

# Includes ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'


group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec'
end

group :development, :test do
  gem 'faker'
  gem 'factory_girl'
  gem 'tux'
  gem 'pry'
end