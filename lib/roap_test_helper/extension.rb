require 'ripper'

module Roap
  module TestHelper
    module Extension
      extend Roap::AttributeBase
    
      #static
      on /test-me\s*((?<args>.*)=>(?<should>.*))?/ do |klass, method, md|
        args = eval md[:args].to_s
        should = eval md[:should].to_s

        TestHelper::tests.push({
          :type => :singleton_method,
          :klass => klass,
          :method_name => method.name,
          :args => args,
          :should => should})
      end
      
      #static
      on capture_under("@example") do |klass, method, md|
        body = Roap::Utils::decomment md[:body]
        last = Ripper.lex(body.lines.last).last

        if last[1] == :on_comment
          last[2].gsub! /^#=>*/, ""

          should = eval last[2]

          TestHelper::tests.push({
            :type => :code,
            :klass => klass,
            :method_name => method.name,
            :should => should,
            :code => body})
        end
      end
    end
  end
end
