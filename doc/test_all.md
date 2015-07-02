Roap::TestHelper::test_all *options
====

등록된 모든 테스트를 실행시킵니다.

__*options__
테스트 실행에 지정할 옵션의 목록입니다.
* 옵션 목록
  * :stop_on_failure
    * 테스트가 실패하면 이후의 테스트는 실행하지 않고 테스팅을 마칩니다.
  * :suppress_stdout
    * 테스트 중일 때 STDOUT으로 출력되는것을 방지합니다.

```rb
options = [:stop_on_failure, :suppress_stdout]

Roap::TestHelper::test_all *options
```
