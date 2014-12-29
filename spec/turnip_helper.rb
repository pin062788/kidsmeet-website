require 'rails_helper'

require 'turnip/capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'



def register_selenium config
  Capybara.register_driver :selenium do |app|
    driver = Capybara::Selenium::Driver.new(app)
    driver
  end

  Capybara.configure do |config|
    config.default_driver = :selenium
    config.javascript_driver = :selenium
    config.ignore_hidden_elements = true
  end
end

def register_poltergeist config
  Capybara.register_driver :poltergeist do |app|
    driver = Capybara::Poltergeist::Driver.new(app)
    driver.resize(1280, 720)
    driver
  end
  Capybara.javascript_driver = :poltergeist
end


RSpec.configure do |config|
  register_poltergeist config
  #register_selenium config

  Capybara.configure do |config|
    config.match = :prefer_exact
  end
end
