#source 'https://rubygems.org'
source 'https://ruby.taobao.org'

# core
gem 'rails', '4.1.6'
gem 'mysql2'

# presentation
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'slim-rails'
gem 'font-awesome-rails'
gem 'kaminari', '~> 0.16.1'

#sidekiq
gem 'sinatra', require: false
gem 'sidekiq'

#paperclip
gem 'paperclip','3.4.2'
gem 'paperclip-compression'

group :development, :test do
  gem 'annotate'
  gem 'spring'
  gem 'byebug',     :platform => :ruby_20
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  gem 'guard-rspec'
end

group :test do
  gem 'database_rewinder'
  gem 'turnip'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'poltergeist'
end
