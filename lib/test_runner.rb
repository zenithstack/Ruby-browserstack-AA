require_relative '../config/browserstack_config'

def run_tests_in_parallel(test_method)
  threads = DEVICES.map do |device|
    Thread.new { test_method.call(device) }
  end

  threads.each(&:join)
end
