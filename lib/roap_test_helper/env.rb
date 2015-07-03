module Roap
  module TestHelper
    class Env
      attr_writer :setup
      attr_writer :teardown

      def setup
        @setup.call if @setup != nil
      end
      def teardown
        @teardown.call if @setup != nil
      end
    end
    class EnvManager
      @@env = {}

      def self.register_env klass, env
        @@env[klass] = env
      end
      
      def self.setup klass
        @@env[klass].setup if @@env[klass] != nil
      end
      def self.teardown klass
        @@env[klass].teardown if @@env[klass] != nil
      end
    end
  end
end
