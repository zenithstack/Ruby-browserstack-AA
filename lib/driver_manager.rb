require 'appium_lib'
require_relative '../config/browserstack_config'

def create_driver(device_name, caps)
  test_name = caller_locations(1,1)[0].label
  session_name = "#{test_name} - #{device_name}"


  merged_caps = caps.merge({
    "appium:app" => APP_ID,
    "bstack:options" => {
      "projectName" => "Ruby Appium",
      "buildName" => "describe test 7",
      "sessionName" => session_name,
      "userName" => USERNAME,
      "accessKey" => ACCESS_KEY,
      "debug" => true
    }
  })

  opts = {
    caps: merged_caps,
    appium_lib: {
      server_url: "https://#{USERNAME}:#{ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub"
    }
  }

  Appium::Driver.new(opts, true).start_driver
end
