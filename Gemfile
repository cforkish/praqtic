source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', git: 'git://github.com/rails/rails.git', branch: '4-0-stable'
# gem 'rails', '4.0.0'
gem 'pg', '0.15.1'
gem 'bcrypt-ruby', '3.1.0'
gem 'cancan', '1.6.10'
gem 'faker', '1.1.2'
gem 'will_paginate', '3.0.4'

group :development, :test do
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'guard-spork', '1.5.0'
end

group :test do
  gem 'selenium-webdriver', '2.0.0'
  gem 'capybara', '2.1.0'
  gem 'growl', '1.0.3'
  gem 'factory_girl_rails', '4.2.1'
  gem 'simplecov', '0.7.1', require: false
end

gem 'sass-rails', '4.0.0'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.0'
gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.1.1'
gem 'jquery-turbolinks'
gem 'jbuilder', '1.0.2'

gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'
gem 'bootstrap-will_paginate', '0.0.9'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'newrelic_rpm'
end
