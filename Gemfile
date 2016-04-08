source "https://rubygems.org"

ruby "2.3.0"

gem "rails", "4.2.5"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "sdoc", "~> 0.4.0", group: :doc
gem "bcrypt", "~> 3.1.7"
gem "responders", "~> 2.0"
gem "materialize-sass"
gem "mechanize"
gem "useragent"
gem "sidekiq"
gem "zeroclipboard-rails"

group :development, :test do
  gem "byebug"
  gem "spring-commands-rspec"
  gem "spring-commands-cucumber"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "selenium-webdriver"
  gem "sqlite3"
  gem "pry"
  gem "coveralls", require: false
end

group :production do
  gem "pg"
  gem "unicorn"
  gem "rails_12factor"
end

group :development do
  gem "web-console", "~> 2.0"
  gem "spring"
end

group :test do
  gem "capybara"
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "shoulda-matchers", require: false
  gem "transactional_capybara"
end

gem "simplecov", require: false, group: :test
