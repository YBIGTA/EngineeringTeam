# 과제12

## 과제 내용
### 1. scp
1. 구글 드라이브(HW -> week12)에 업로드 된 텍스트 파일(example.txt)을 인스턴스로 전송
    - 명령어 : scp -i [pem key] [보낼 파일] [받을 디렉토리]
    - 예시 : scp -i ./kimhyunwoo_aws.pem ./DE/example.txt ubuntu@12.123.12.14:/home/ubuntu/hw11

### 2. hdfs
1. hadoop 시작
    - start-dfs.sh와 start-yarn.sh 실행
    
2. hdfs에 자기 이름으로 디렉토리 생성
    - 명령어 : hdfs dfs -mkdir [디렉토리]
    - 예시 : hdfs dfs -mkdir /ybigta/hyunwoo
    
3. 가져온 텍스트 파일을 hdfs에 업로드
    - 명령어 : hdfs dfs -put [보낼 파일] [hdfs 디렉토리]
    - 예시 : hdfs dfs -put ./hw11/example.txt /ybigta/hyunwoo
    
4. 조회
    - 명령어 : hdfs dfs -ls [hdfs 디렉토리]
    - 예시 : hdfs dfs -ls /ybigta/hyunwoo

### 3. 논문 리뷰
1. 주어진 논문을 읽고 자유형식으로 정리
    - [https://www.usenix.org/system/files/conference/nsdi12/nsdi12-final138.pdf](https://www.usenix.org/system/files/conference/nsdi12/nsdi12-final138.pdf)
    - 예시 : [https://hwkim94.github.io/distributed-computing/spark/rdd/paperreview/2018/05/15/Spark2.html](https://hwkim94.github.io/distributed-computing/spark/rdd/paperreview/2018/05/15/Spark2.html)
    - 참고자료 : [https://www.slideshare.net/yongho/rdd-paper-review?qid=4a433eb3-47fc-41bc-b750-a4b3f33c8100&v=&b=&from_search=1](https://www.slideshare.net/yongho/rdd-paper-review?qid=4a433eb3-47fc-41bc-b750-a4b3f33c8100&v=&b=&from_search=1)

## 제출사항
1. scp로 전송을 한 후, 100% 전송되었다는 결과를 캡쳐
2. hdfs에 파일을 올린 후, 조회한 화면을 캡쳐
3. markdown, txt, hwp, docs 등 자유형식으로 정리

## 제출기한
- 연고전 관계로 목요일(10월 4일)까지 제출
- 구글드라이브 week12에 자신 이름의 폴더를 만들고 그 안에 캡쳐한 화면과 논문요약 제출
