roap_test_helper
====


Extension Attributes
----
* __test-me__ [args] => result

  ```rb
  class Foo
    #test-me [4,1] => 5
    def self.sum a,b
      return a+b
    end
  end
  ```
* __@example__

  ```rb
  class Foo
    # @example
    #   v = Foo.new
    #   v.zoo "MILK", "DOT" #=> "MILKDOT"
    def zoo msg1, msg2
      return msg1 + msg2
    end
  end
  ```

Options
----
* __:suppress_stdout__ : 
* __:stop_on_failure__ :
