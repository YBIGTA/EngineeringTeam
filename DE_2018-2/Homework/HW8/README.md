# 과제8 - 카프카 실행시키기

## 과제 내용
### 1. 카프카 준비
1. 주키퍼와 카프카가 설치되어 있는 인스턴스를 작동시킵니다.
2. 각각의 환경설정에서 ip주소를 새로운 ip주소로 변경합니다.
3. 주키퍼와 카프카를 실행시킵니다.

### 2. 카프카에 토픽만들기(콘솔)
1. 카프카에 topic-hw1, topic-hw2 라는 토픽을 각각 생성합니다. 이때, partion의 개수는 각각 1개, 3개로 만들어줍니다.
2. 카프카에서 토픽 리스트를 조회하여 토픽이 생성되었는지 확인해봅니다.

### 3. 카프카에 메시지 보내기(파이썬) 
1. 프로듀서 콘솔을 실행시켜 각각의 토픽에 원하는 메시지를 20개 이상 보냅니다.

### 4. 카프카에서 메시지 가져오기(파이썬)
1. 컨슈머 콘솔을 실행시켜 각각의 토픽에서 메시지를 가져옵니다
2. 파티션의 개수가 3개인 hw2에 대해서 각각의 파티션에 담겨있는 메시지만 가져옵니다.

## 제출사항
1. 주키퍼와 카프카를 실행시킨 후 각각의 인스턴스에서 jps를 입력한 결과
2. 2-2의 토픽 리스트
3. 3-1의 메시지를 보내는 화면
4. 4-1, 4-2의 메시지를 가져온 화면

위의 내용을 캡쳐하여 구글 드라이브에 
