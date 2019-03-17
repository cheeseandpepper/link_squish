ruby '2.6.2'
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails',        '~> 5.1.5'
gem 'pg',           '>= 0.18', '< 2.0'
gem 'puma',         '~> 3.7'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'
gem 'validate_url', '~> 1.0'
gem 'jquery-rails', '~> 4.3'
gem 'redis',        '~> 3.0'
gem 'bootstrap',    '~> 4.3.1'

group :development, :test do
  gem 'byebug',      platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails',         '~> 0.3'
  gem 'rspec-rails',       '~> 3.8'
  gem 'factory_bot_rails', '~> 5.0'
end


group :development do
  gem 'spring'
  gem 'web-console',           '>= 3.3.0'
  gem 'listen',                '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
