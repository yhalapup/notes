source "https://rubygems.org"

ruby "3.2.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "mysql2", "~> 0.5"
gem "puma", "~> 6.4.2", ">= 6.4.2"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "resque", "2.6.0"
gem "resque-scheduler", "4.10.2"
gem "roar-jsonapi", "0.0.3"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]
  gem "pry-byebug"
  gem "rspec-rails", "~> 6.1.0"
  gem "rubocop", "~> 1.58", require: false
  gem "rubocop-migration", "~> 0.4.2", require: false
  gem "rubocop-performance", "~> 1.19", require: false
  gem "rubocop-rails", "~> 2.22", require: false
  gem "rubocop-thread_safety", "~> 0.5.1", require: false
end
