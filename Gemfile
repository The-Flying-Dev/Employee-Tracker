source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.10'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.6', '>= 6.1.6.1'
gem 'sass-rails', '>= 6'
#gem 'sqlite3', '~> 1.4'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'friendly_id', '~> 5.4.0'
gem 'pagy', '~> 5.10', '>= 5.10.1'
gem 'ransack'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.36', require: false
  gem 'web-console', '>= 4.1.0'
  gem 'sqlite3', '~> 1.4'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
  gem 'shoulda', '~> 4.0'
end

group :production do
  gem 'pg', '~> 1.4', '>= 1.4.3'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
