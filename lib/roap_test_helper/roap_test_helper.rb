require 'stringio'

module Roap
  module TestHelper
    @@tests = []
    def self.tests
      @@tests
    end

    def self.test_all *options
      puts "Roap::TestHelper::test_all"
      
      if options.include? :suppress_stdout
        original_stdout = $stdout
        $stdout = File.open(File::NULL, "w")  
      end

      @@tests.each do |test|
        method = test[:klass].singleton_method test[:method_name]
        
        result = method.call *test[:args]
        if result != test[:should]
          STDERR.puts "test faild / #{test[:klass]}::#{test[:method_name]}"
          STDERR.puts "  => #{result} / should #{test[:should]}"

          if options.include? :stop_on_failure
            puts "test_all stopped by stop_on_failure option"
            break
          end
        end
      end
      
      $stdout = original_stdout if options.include? :suppress_stdout
    end
  end
end
