require 'rubygems'

# All our specs should require 'spec_helper' (this file)

# If RACK_ENV isn't set, set it to 'test'.  Sinatra defaults to development,
# so we have to override that unless we want to set RACK_ENV=test from the
# command line when we run rake spec.  That's tedious, so do it here.
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'shoulda-matchers'
require 'rack/test'
require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'
# require 'capybara/poltergeist'


RSpec.configure do |config|
  config.include Rack::Test::Methods
end



Capybara.app = Sinatra::Application

Capybara.default_driver = :selenium


Capybara.configure do |config|
  config.run_server = false
  config.app_host   = 'http://www.mormonmapper.com'
end

def app
  Sinatra::Application
end
