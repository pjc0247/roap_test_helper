roap_test_helper
====
Roap을 이용한 테스트 프레임워크입니다.<br>
주석에 작성된 예제 코드들과 테스팅을 연동시킬 수 있도록 도와줍니다.

Links
----
* (doc)[doc/]

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
* __@example__ &block

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
  
Usage
----
```rb
options = [:suppress_stdout, :stop_on_failure]

Roap::TestHelper::test_all *options
```

Options
----
* __:suppress_stdout__ : 테스트 동안 STDOUT으로의 출력을 차단합니다.
* __:stop_on_failure__ : 실패한 테스트가 있을 경우 바로 모든 테스트를 중단합니다.
