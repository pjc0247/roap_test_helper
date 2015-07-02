test-me [args] => result
====

테스트 타임에 메소드를 실행합니다.<br>
메소드는 반드시 클래스 메소드이어야 합니다.

__args__<br>
메소드에 넘길 인자의 목록입니다.<br>
배열 타입이어야 합니다.

__result__<br>
반환되어야 하는 결과값입니다.<br>
테스트 타임에 실행 후 반환된 값과 이 값이 일치하는지 테스트하게 됩니다.

```rb
class Foo
  
  #test-me [1,2,3] => 6
  def self.sum a,b,c
    return a + b + c
  end
end
```

