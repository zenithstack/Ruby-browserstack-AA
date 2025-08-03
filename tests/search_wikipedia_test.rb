require 'selenium-webdriver'
require_relative '../lib/driver_manager'

def search_wikipedia_test(device)
  driver = nil

  begin
    puts "[#{device[:name]}] Starting test..."
    driver = create_driver(device[:name], device[:caps])

    wait = Selenium::WebDriver::Wait.new(timeout: 30)
    wait.until { driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
    driver.find_element(:accessibility_id, "Search Wikipedia").click

    wait.until { driver.find_element(:id, "org.wikipedia.alpha:id/search_src_text").displayed? }
    driver.find_element(:id, "org.wikipedia.alpha:id/search_src_text").send_keys("BrowserStack")

    results = driver.find_elements(:class, "android.widget.TextView")
    if results.any?
      puts "[#{device[:name]}] ✅ Test Passed"
      driver.execute_script('browserstack_executor: {"action":"setSessionStatus","arguments":{"status":"passed","reason":"Found results"}}')
    else
      puts "[#{device[:name]}] ❌ Test Failed"
      driver.execute_script('browserstack_executor: {"action":"setSessionStatus","arguments":{"status":"failed","reason":"No results found"}}')
    end
  rescue => e
    puts "[#{device[:name]}] 💥 Error: #{e.message}"
    driver&.execute_script('browserstack_executor: {"action":"setSessionStatus","arguments":{"status":"failed","reason":"Test crashed"}}')
  ensure
    driver&.quit
    puts "[#{device[:name]}] Test finished."
  end
end
