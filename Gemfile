source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
gem 'pg'
gem 'active_model_serializers', '~> 0.10.0'
gem 'will_paginate'
gem 'api-pagination'

gem 'dotenv'

gem 'devise', :git => 'https://github.com/plataformatec/devise.git'
gem 'devise-jwt'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri]#, :mingw, :x64_mingw]
  gem 'faker'
  gem 'pry-rails'
  gem 'bullet'
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'rspec-rails' #The RSpec testing framework with Rails integrations
  gem 'rspec-json_expectations'
end
