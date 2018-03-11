source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# GLOBAL RUBY RAILS
gem 'rails', '~> 5.0.4'
gem 'friendly_id', '~> 5.0.3'

# APPLICATION
gem 'figaro'

# AUTHENTICATION
gem 'cancancan'
gem 'devise'
gem 'rolify'

# DATABASE
gem 'pg', '~> 0.18'

# AMAZON
gem 'aws-sdk'

# SERVER
gem 'puma', '~> 3.0'

gem 'foreman'

# CSS
gem 'data-confirm-modal'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails'
gem 'twitter-bootstrap-rails'

# JS
gem 'coffee-rails', '~> 4.2'
gem 'jquery-datatables-rails', '~> 3.4.0'
gem 'jquery-validation-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'therubyracer'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

#IMAGES
gem 'imgkit'
gem 'wkhtmltoimage-binary'
gem 'masonry-rails'
gem 'paperclip', '~> 5.0.0'

#ICONS
gem 'material_icons'


# GLOBALISATION & I18n
gem 'devise-i18n'
gem 'i18n-js'

group :development, :test do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'binding_of_caller'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'selenium-webdriver'
  gem 'shoulda'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
