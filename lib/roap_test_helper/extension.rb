module Roap
  module TestHelper
    module Extension
      extend Roap::AttributeBase
    
      #static
      on /test-me\s*((?<args>.*)=>(?<should>.*))?/ do |klass, method, md|
        args = eval md[:args].to_s
        should = eval md[:should].to_s

        TestHelper::tests.push({
          :klass => method.receiver,
          :method_name => method.name,
          :args => args,
          :should => should})
      end
    end
  end
end
