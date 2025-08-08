require_relative './tests/search_wikipedia_test'
require_relative './tests/another_test'

require_relative './lib/test_runner'

require_relative './tests/describe_style_test'


# Wrap each run_tests_in_parallel in its own thread
threads = []

# run_tests_in_parallel(method(:search_wikipedia_test))
# threads << Thread.new { run_tests_in_parallel(method(:search_wikipedia_test)) }
threads << Thread.new { run_tests_in_parallel(method(:describe_style_test)) }

# threads << Thread.new { run_tests_in_parallel(method(:another_test)) }

# Wait for both test suites to complete
threads.each(&:join)
