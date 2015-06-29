ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'capybara/poltergeist'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Capybara::Assertions
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end

  # Add more helper methods to be used by all tests here...
end
