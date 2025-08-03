require 'dotenv/load'

USERNAME = ENV['BROWSERSTACK_USER'] || 'zenithmehta_PD0ML9'
ACCESS_KEY = ENV['BROWSERSTACK_ACCESSKEY'] || 'PsVY25rqD5zTZtQqexxQ'
APP_ID = 'bs://sample.app'  # Replace with real ID

DEVICES = [
  {
    name: 'Samsung Galaxy S21 Ultra',
    caps: {
      "platformName": "android",
      "appium:platformVersion": "11.0",
      "appium:deviceName": "Samsung Galaxy S21 Ultra"
    }
  },
  {
    name: 'Google Pixel 8 Pro',
    caps: {
      "platformName": "android",
      "appium:platformVersion": "14.0",
      "appium:deviceName": "Google Pixel 8 Pro"
    }
  },
  {
    name: 'Xiaomi Redmi Note 13 Pro 5G',
    caps: {
      "platformName": "android",
      "appium:platformVersion": "14.0",
      "appium:deviceName": "Xiaomi Redmi Note 13 Pro 5G"
    }
  }
]
