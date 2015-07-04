@example &block #=> result
====

__&block__<br>
테스트 타임에 실행할 코드의 블록입니다.<br>
블록의 마지막 줄은 값을 반환해야 합니다.

__result__<br>
블록의 마지막 줄에서 반환한 값과 result를 비교하여 테스트 성공 여부를 결정합니다.<br>
result의 타입은 표현식이며, 메소드가 테스트 목록에 추가될 때 실행됩니다.<br>
<br>
만약 익셉션의 클래스 이름이 위치할 경우 반환 값 대신 익셉션의 클래스와 비교를 수행합니다.


```rb
class Foo
  # @example
  #   f = Foo.new
  #   f.sum 1,5 #=> 6
  def sum a,b
    return a + b
  end
end
```
```rb
class Foo
  # @example
  #   Foo.bar(nil) #=> ArgumentError
  def self.bar a
    raise ArgumentError if a == nil
  end
end
```
