ruby_appium/
│
├── config/
│   └── browserstack_config.rb     # Holds credentials, devices, caps
│
├── lib/
│   └── driver_manager.rb          # Handles session creation, teardown
│   └── test_runner.rb             # Orchestrates running tests in parallel
│
├── tests/
│   ├── search_wikipedia_test.rb   # A specific test case
│   └── another_test.rb            # Another test case (future)
│
└── main.rb                        # Entry point




 gem install dotenv
 
cmd to run :  ruby main.rb     