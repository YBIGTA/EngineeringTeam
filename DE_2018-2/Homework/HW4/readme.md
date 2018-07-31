## 과제 4

- 만들어야 할 Java Files
  - DateNameWritable.java (CustomWritableComparable)
  - DateNameMapper.java (Mapper)
  - DateNameReducer.java (Reducer)
  - DateNameDriver.java (Driver)
  - MonthPartitioner.java (Partitioner)


- Test Data
  - hw4-input.txt (구글 드라이브의 3. HW/week 4/ 위치에 데이터를 업로드 해두었습니다.)


- 과제 개요
  - 이 과제의 목표는 Custom Partitioner와 Custom WritableComparable을 구현해보는 것입니다.
  - 또한 ToolRunner로 커맨드라인에서 파라미터를 전달하는 것은 연습해 보려고 합니다.
  - 날짜, 이름, 지출액으로 이루어진 input 파일을 받아서 각 월, 날짜, 이름별로 지출액의 합계 또는 평균 구하려고 합니다.


- 예시

  - input)

    *2018-01-15 김우정 1000*

    *2018-01-15 김우정 2000*

    *2018-01-16 김우정 3000*

    *2018-01-16 김우정 2000*

    *2018-01-16 우혜원 1000*

    *2018-02-13 김우정 9000*

    *2018-02-15 김우정 5000*

    *2018-03-17 우혜원 3000*

  - output)

    - *part-r-00000 (1월의 데이터)*

      *(날짜:2018-01-15, 이름:김우정) 3000*

      *(날짜:2018-01-16, 이름:김우정) 5000*

      *(날짜:2018-01-16, 이름:우혜원) 1000*

    - *part-r-00001 (2월의 데이터)*

      *(날짜:2018-02-13, 이름:김우정) 9000*

      *(날짜:2018-02-15, 이름:김우정) 5000*

    - *part-r-00002 (3월의 데이터)*

      *(날짜:2018-03-17, 이름:우혜원) 3000*


- 구현 가이드
  - github 에서 스켈레톤 프로젝트를 내려받아 이용한다.
  - com.ybigta.hw4.example.writables 이란 패키지를 만들고 그 패키지 아래에 아래의 것들을 구현한다.
  - 만약 커맨드 라인에서 job을 실행할 때 getAverage 옵션을 true로 주면 각 날짜와 이름에 대한 지출액의 평균을 구하고, 옵션을 false로 주면 합을 구한다.


- CustomWritable 구현 가이드

  - 이 부분은 DateNameWritable이라는 새로운 자료형을 만드는 부분이다.
  - Homework 채널의 week 4/input, skeleton 폴더에 있는 SkeletonCustomWritable.java를 복사해서 DateNameWritable을 만든다.
  - DateNameWritable은 날짜(date)와 이름(name)이라는 두 Text 변수를 가지고 있다. SkeletonCustomWritable과 거의 유사한 구조이다.
  - compareTo 메소드는 두 writableComparable 사이의 대소관계를 정의한다.
    - date에서 년, 월, 일을 각각 구분하여 int 변수로 만들고 대소관계를 정의한다.
    - 강의자료에 자세한 설명이 나와있다.
  - toString 메소드에서 이 자료형이 어떻게 출력될지를 정의해 준다.
    - 출력 예시
      - (날짜:*2018-01-15*, 이름:*김우정*)

- Mapper 구현 가이드

  - SkeletonMapper 를 복사해 DateNameMapper 를 만든다. 
    - Input <Key, Value> 는 <LongWritable, Text> 이다.
    - Output <Key, Value> 는 <DateNameWritable, LongWritable> 이다.
    - 따라서 클래스의 선언부는 다음과 같다.`public class DateNameMapper extends Mapper<LongWritable, Text, DateNameWritable, LongWritable>`
  - DateNamerMapper의 map 함수를 구현한다.
  - DateNameMapper의 input value로는 다음과 같은 한 줄이 들어온다.
    *ex) 2018-01-15 김우정 1000*
    input value를 이용하여 아래와 같은 처리를 한다.
    1. 이 input value를 공백 단위로 구분해 단어들을 List 또는 array 같은 선형 자료구조에 담는다.
    2. 해당 자료구조를 순회하며 output 으로 <DatenameWritable 형태의 key, 금액> 를 내보낸다.
       - DateNameWritable 형태의 변수에 새로운 값을 넣고 싶을 때에는 set 메소드를 이용한다.
       - String 자료형 변수 s를 Long 자료형 변수 l로 바꾸고 싶을 때에는 `l = Long.parseLong(s);` 이런 식으로 하면 된다.

- CustomPartitioner 구현 가이드

  - 이 부분은 사용자가 직접 특정 key 값에 따른 reducer를 할당하는 부분이다.
  - Homework 채널의 week 5/input, skeleton 폴더에 있는 SkeletonCustomPartitioner.java를 복사해서 MonthPartitioner을 만든다.
  - mapper output의 key는 DateNameWritable이고, value는 LongWritable이다
  - 따라서 클래스의 선언부는 다음과 같다 `public class MonthPartitioner extends Partitioner<DateNameWritable, LongWritable>`
  - getPartition 메소드는 reducer 번호를 반환한다. getPartition 메소드의 선언부는 다음과 같다. `public int getPartition(DateNameWritable key, LongWritable value, int numReduceTasks)`
  - key값으로 들어오는 각 월마다 다른 reducer를 할당한다. 따라서 총 reducer는 12개이다
    - 1월 -> 0번 reducer
    - 2월 -> 1번 reducer ...
  - 참고
    - String 객체의 특정 부분만 가져오고 싶을 때에는 substring 메소드를 쓴다.
    - String을 Integer로 바꾸고 싶을 때에는 Integer.parseInt(s)을 쓴다.

- Reducer 구현 가이드

  - SkeletonReducer 를 복사해 DateNameReducer 를 만든다.

    - Output <Key, Value> 는 <DateNameWritable, LongWritable> 이다.
    - Input <Key, Value> 는 <DateNameWritable, LongWritable> 이다.
    - 따라서 클래스의 선언부는 다음과 같다.`public class DateNameReducer extends Reducer<DateNameWritable, LongWritable, DateNameWritable, LongWritable>`

  - DateNameReducer의 reduce 함수를 구현한다.

  - setup 메소드에서는 reduce 함수가 실행되기 전에 변수를 설정한다. toolrunner를 통해 받은 parameter를 reduce 클래스의 전역 변수로 선언하는 역할을 한다. setup메소드의 자세한 설명은 cloudera 자료의 267-269쪽을 참고한다. setup 메소드의 예시는 다음과 같다.

    ```java
    @Override
    public void setup(Context context){
    Configuration conf = context.getConfiguration();
    this.getAverage = conf.getBoolean("getAverage", false);
    }
    ```

  - Partitioner를 통하여 같은 달의 데이터들이 모여 있게 된다.

    - *ex) <Key, Value> 예시*
      <(날짜:2018-01-15, 이름:김우정),  [1000, 2000]>
      <(날짜:2018-01-16, 이름:김우정),  [2000, 3000]>

  - reduce 메소드에서는 아래와 같은 처리를 한다.

    1. 만약 getAverage 변수가 true이면 values 를 순회하며 values 안에 있는 값들의 평균을 구한다.
    2. 만약 getAverage 변수가 false이면 values 를 순회하며 values 안에 있는 값들의 합을 구한다.
    3. 주어진 key와 1에서 구한 결과를 write 한다.


- Driver 구현 가이드
  - 프로젝트는 1개의 Mapper 클래스, 1개의 Reducer 클래스, 1개의 Writable 클래스, 1개의 Partitioner 클래스를 가지고 있다.
  - Skeleton 프로젝트의 SkeletonDriver 클래스를 참고한다.
    1. SkeletonDriver 를 복사해 DateNameDriver 를 만든다.
    2. main 메소드 안에서 **ToolRunner.run** 함수를 호출한다.
    3. job.setJarByClass, job.setMapperClass, job.setReducerClass, job.setPartitionerClass에 구현한 Driver, Mapper, Reducer, Partitioner를 맞게 채워준다.
    4. job.setNumReduceTasks()에 필요한 reducer의 숫자를 채워준다.
    5. job.setMapOutputKeyClass()와 setMapOutputValueClass()를 mapper의 output <Key, Value>와 맞춰준다.
    6. job.setOutputKeyClass()와 job.setOutputValueClass()부분을 Reducer의 Output <Key, Value> 과 맞춰준다.
    7. 나머지 부분은 특별히 건드리지 않는다.


- 실행 가이드

  - 메이븐 build를 통해 이 프로젝트를 패키징한다. 스켈레톤 프로젝트를 이용했다면 target 디렉토리 밑에 hadoop-study-0.0.1.jar 이 생길 것이다.
  - jar 파일을 EC2로 전송한다.
  - EC2 에서 하둡을 실행시킨다.
  - 과제와 함께 첨부된 예제 데이터 파일을 hdfs 의 원하는 경로에 업로드한다.
  - wordcount 를 실행시킬때와 마찬가지로 hadoop jar 명령어를 이용해 작성한 프로그램을 실행한다.

- 제출 파일

  - 하둡 실행 결과 파일을 조회한 이미지

    1. getAverage를 true로 줬을 때 실행한 결과

       - jar 실행 명령 예시

         ```bash
         hadoop jar /home/ubuntu/workspace/180728/HW/datename-0.0.1.jar com.ybigta.example.hw4.writables.DateNameDriver -DgetAverage=true /ybigta/hadoop/HW/180728-input.txt /ybigta/hadoop/HW/outpu
         ```

    2. getAverage를 false로 줬을 때 실행한 결과

  - 자바 소스 코드 파일 5개
