roap_test_helper
====


Extension Attributes
----
* test-me [args] => result
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
* :suppress_stdout : 
* :stop_on_failure :
