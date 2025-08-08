require 'rspec'
require 'appium_lib'
require_relative '../config/browserstack_config'
require_relative '../lib/driver_manager'

def describe_style_test(device)
  RSpec.describe "Wikipedia Search Test on #{device[:name]}" do
    before(:each) do
      @driver = create_driver(device[:name], device[:caps])
      Appium.promote_appium_methods Object
      @wait = Selenium::WebDriver::Wait.new(timeout: 20)
    end

    after(:each) do
      @driver.quit
    end

    it 'clicks Search Wikipedia - test 1' do
      @wait.until { @driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
      @driver.find_element(:accessibility_id, "Search Wikipedia").click
    end

    it 'clicks Search Wikipedia - test 2' do
      @wait.until { @driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
      @driver.find_element(:accessibility_id, "Search Wikipedia").click
    end

    it 'clicks Search Wikipedia - test 3' do
      @wait.until { @driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
      @driver.find_element(:accessibility_id, "Search Wikipedia").click
    end
  end

  # Run the RSpec test block immediately
  RSpec::Core::Runner.run([])
end
