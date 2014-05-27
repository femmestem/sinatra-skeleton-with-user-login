# source :rubygems
source 'https://rubygems.org'

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

# Use Thin for our web server
gem 'thin'

gem 'activesupport'
gem 'activerecord'
gem 'shotgun'

gem 'bcrypt'
# gem 'bcrypt-ruby'
#`bcrypt (~> 3.1.7)` required in Gemfile to use `:has_secure_password`
# gem 'bcrypt', '~> 3.1.7'

# gem 'bcrypt-ruby'

gem 'rake'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker'
end