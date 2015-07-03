require 'stringio'

module Roap
  module TestHelper
    @@tests = []

    def self.tests
      @@tests
    end

    def self.on klass, &block
      @env = Env.new

      def self.setup &block
        @env.setup = block
      end
      def self.teardown &block
        @env.teardown = block
      end

      EnvManager::register_env klass, @env

      instance_eval &block
    end

    def self.test_all *options
      puts "Roap::TestHelper::test_all"
      
      if options.include? :suppress_stdout
        original_stdout = $stdout
        $stdout = File.open File::NULL, "w"
      end

      @@tests.each do |test|
        #setup
        EnvManager::setup :global
        EnvManager::setup test[:klass]

        if test[:type] == :singleton_method
          method = test[:klass].singleton_method test[:method_name]
        
          begin
            result = method.call *test[:args]
          rescue Exception => e
            exception = e
          end
        elsif test[:type] == :code
          begin
            result = eval test[:code]
          rescue Exception => e
            exception = e
          end
        end

        #teardown
        EnvManager::teardown test[:klass]
        EnvManager::teardown :global
        
        if exception or result != test[:should] and
          exception.class != test[:should]

          STDERR.puts "test faild / #{test[:klass]}::#{test[:method_name]}"
          STDERR.puts "  => #{result} / should #{test[:should]}"

          if exception
            STDERR.puts "  => #{exception}"
          end

          if options.include? :stop_on_failure
            STDERR.puts "test_all stopped by stop_on_failure option"
            break
          end
        end
      end
      
      $stdout = original_stdout if options.include? :suppress_stdout
    end
  end
end
