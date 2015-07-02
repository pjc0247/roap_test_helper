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

Options
----
* __:suppress_stdout__ : 
* __:stop_on_failure__ :
