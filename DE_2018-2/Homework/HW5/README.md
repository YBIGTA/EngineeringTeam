## 과제 4

- 만들어야 할 Java Files
  - MemberKey.java (복합키)
  - MemberKeyComparator.java (복합키 비교기)
  - GroupKeyComparator.java (그룹키 비교기)
  - GroupKeyPartitioner.java (그룹키 파티셔너)
  - MemberIdCountMapper.java (Mapper)
  - MemberIdCountReducer.java (Reducer)
  - MemberIdCountDriver.java (Driver) -> 그냥 어떤 부분이 위에서 만든 클래스로 set되었는지 읽어보기 (따로 구현X. 그대로 복붙해서 쓰기)


- Test Data
  - hw5-input.csv (구글 드라이브의 3. HW/week 5/ 에 업로드)


- 과제 개요
  - 이 과제의 목표는 Secondary Sort를 위한 필요한 클래스들을 구현해보고 실제로 데이터를 사용하여 정렬해보는 것입니다.
  - 기수, 학번, 이름으로 이루어진 input 파일을 받아서 각 기수별 학번 분포를 구하는 secondary sort 알고리즘을 구현해본다. 이때, 기수와 학번을 이용하여 오름차순 정렬을 한뒤, 각 기수별 속해있는 학번의 수를 counting해본다. 

- 예시

  - input)

    *10기 ,13,박지영*
    
    *10기 ,11,박지영*
    
    *11기 ,17,박지영*
    
    *11기 ,11,박지영*
    
    *12기 ,10,박지영*
    
    *12기 ,13,박지영*
    
    *13기 ,14,박지영*
    
    *13기 ,13,박지영*
   
  - output)
    *YBIGTAMEMBERS-r-00000*
        
        *11기 ,13학번  5*
        
        *11기 ,14학번  4*
        
        *11기 ,15학번  2*
        
        *11기 ,16학번  4*
        
        *11기 ,17학번  2*
        
        *12기 ,12학번  2*
        
        *12기 ,13학번  3*
        
        *12기 ,14학번  7*
        

- 구현 가이드
  - github 에서 스켈레톤 프로젝트를 내려받아 이용한다.
  - com.ybigta.hw5.example.secondarySort 란 패키지를 만들고 그 패키지 아래에 아래의 것들을 구현한다.
  - 지난번 강의자료의 secondary sort 부분의 예제 코드를 참고해도 좋다(어느 정도의 흐름만 참고. 완전히 똑같지는 않음).
  - 같이 올려주는 java 파일(txt 파일 형태로 제공될 예정. 해당 패키지에 각 클래스 이름 그대로 클래스 생성 뒤 복붙해서 코드 )들에 달린 주석을 참고하여 구현한다. 


- 실행 가이드

  - maven build를 통해 이 프로젝트를 패키징한다. 스켈레톤 프로젝트를 이용했다면 target 디렉토리 밑에 hadoop-study-0.0.1.jar 이 생길 것이다.
  - jar 파일을 EC2로 전송한다.
  - EC2 에서 하둡을 실행시킨다.
  - 과제와 함께 첨부된 예제 데이터 파일을 hdfs 의 원하는 경로에 업로드한다.
  - hadoop jar 명령어를 이용해 작성한 프로그램을 실행한다.
    *hadoop jar {jar 파일 경로} com.ybigta.hw5.example.secondarySort.MemberIdCountDriver {입력파일경로} {출력파일경로}*

- 제출 파일

  - 하둡 실행 결과 파일을 조회한 이미지

  - 자바 소스 코드 파일 7개


