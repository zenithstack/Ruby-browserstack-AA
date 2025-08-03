
```markdown
# 📱 Ruby Appium Automation with BrowserStack

This project demonstrates running Appium tests written in Ruby on real devices using [BrowserStack App Automate](https://www.browserstack.com/app-automate).

---

## 📁 Project Structure

```
```text
ruby_appium/
│
├── config/
│   └── browserstack_config.rb     # Holds credentials, device config, and capabilities
│
├── lib/
│   ├── driver_manager.rb          # Handles Appium driver lifecycle
│   └── test_runner.rb             # Manages parallel test execution
│
├── tests/
│   ├── search_wikipedia_test.rb   # Sample test: search on Wikipedia app
│   └── another_test.rb            # Placeholder for additional test case
│
└── main.rb                        # Entry point to run all tests


````

---

## 💎 Prerequisites

- macOS/Linux/Windows
- Ruby 3.x or later
- [Appium](https://appium.io/)
- BrowserStack account with valid credentials

---

## 🛠️ Installation

1. **Clone the repository**:

```bash
git clone https://github.com/zenithstack/ruby_appium.git
cd ruby_appium
````

2. **Install required gems**:

```bash
gem install appium_lib
gem install parallel
gem install dotenv
```


## 🔐 Set Up Your Credentials

Create a `.env` file in the root directory:

```env
BROWSERSTACK_USERNAME=your_username
BROWSERSTACK_ACCESSKEY=your_access_key
```

These will be automatically loaded from `config/browserstack_config.rb`.

---

## 🚀 Running Tests

The entry point is `main.rb`. It will load all test cases and run them in **parallel using threads**, like this:

```ruby
require_relative './tests/search_wikipedia_test'
require_relative './tests/another_test'

require_relative './lib/test_runner'

# Wrap each run_tests_in_parallel in its own thread
threads = []

threads << Thread.new { run_tests_in_parallel(method(:search_wikipedia_test)) }
threads << Thread.new { run_tests_in_parallel(method(:another_test)) }

# Wait for both test suites to complete
threads.each(&:join)
```

### ▶️ To run the tests:

```bash
ruby main.rb
```

This will:

* Execute each test file in a separate thread
* Run test scenarios in parallel on real devices using BrowserStack

---

## 📌 Notes

* Add more test cases in the `tests/` directory and refer them inside `main.rb`
* Device and capability settings are managed via `browserstack_config.rb`
* Session management handled in `driver_manager.rb`
* `test_runner.rb` uses the `Parallel` gem for thread-safe execution of scenarios

