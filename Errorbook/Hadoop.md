<table>
  <tr>
    <th>날짜</th>
    <th>작성자</th>
    <th>제목</th> 
    <th>참조링크</th>
  </tr>
  <tr>
    <td>2018/07/11</td>
    <td>11기 김현우</td>
    <td>datanode가 실행되지 않을 때</td>
    <td>http://paranwater.tistory.com/369</td>
  </tr>
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">hadoop을 실행하고나서 jps를 커맨드라인에 입력했을 때 datanode가 없을 경우</td>
  </tr>
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>cd $HADOOP_HOME</p>
      <p>./sbin/stop-all.sh</p>
      <p>cd $HOME</p>
      <p>rm -r data</p>
      <p>cd $HADOOP_HOME</p>
      <p>cd logs</p>
      <p>rm -r *</p>
      <p>cd ..</p>
      <p>hadoop namenode -format</p>
      <p>./sbin/start-all.sh</p>
    </td>
  </tr>
</table>

<table>
  <tr>
    <th>날짜</th>
    <th>작성자</th>
    <th>제목</th> 
    <th>참조링크</th>
  </tr>
  <tr>
    <td>2018/08/01</td>
    <td>11기 김현우</td>
    <td>maven HadoopStudy를 clone하고 maven 빌드를 하려고하는데, jdk관련 에러가 발생할 때</td>
    <td>http://blog.naver.com/PostView.nhn?blogId=jw43834&logNo=220252280525</td>
  </tr>
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">[ERROR] Failed to execute goal on project hadoop-study: Could not resolve dependencies for project com.ybigta:hadoop-study:jar:0.0.1: Could not find artifact jdk.tools:jdk.tools:jar:1.8 at specified path C:\Program Files\Java\jre1.8.0_151/../lib/tools.jar </td>
  </tr>
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>jdk가 있는 경로를 추가해준다.</p>
    </td>
  </tr>
</table>

<table>
  <tr>
    <th>날짜</th>
    <th>작성자</th>
    <th>제목</th> 
    <th>참조링크</th>
  </tr>
  <tr>
    <td>2018/08/01</td>
    <td>11기 김현우</td>
    <td>hadoop jar를 통해서 MapReduce어플리케이션을 실행했을 때, 어떠한 에러도 없이 더 이상 작업이 진행되지 않는 경우</td>
    <td></td>
  </tr>
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">MapReduce가 진행되다가 map : ~~%, reduce : ~~%에서 더 이상 진행되지 않는 경우</td>
  </tr>
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>인스턴스 용량이 부족한 것이 가장 큰 원인으로 지목되므로, 필요없는 자료와 우분투의 쓰레기통을 비워준다.</p>
    </td>
  </tr>
</table>

<table>
  <tr>
    <th>날짜</th>
    <th>작성자</th>
    <th>제목</th> 
    <th>참조링크</th>
  </tr>
  <tr>
    <td>2018/08/01</td>
    <td>11기 김현우</td>
    <td>NodeManager가 실행이 안되는 경우</td>
    <td></td>
  </tr>
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">커맨드라인에 jps를 입력했는데, NodeManager가 실행되지 않는 경우</td>
  </tr>
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>다시 껐다가 켜본다.</p>
    </td>
  </tr>
</table>

<table>
  <tr>
    <th>날짜</th>
    <th>작성자</th>
    <th>제목</th> 
    <th>참조링크</th>
  </tr>
  <tr>
    <td>2018/08/10</td>
    <td>12기 김태오</td>
    <td>INFO mapreduce.Job: Running job: JOB_NAME 에서 진행 안됨</td>
    <td>갓현우피셜</td>
  </tr>
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">hadoop jar ~ 로 하둡을 실행 했을 때 제목과 같은 곳에서 멈춰 더이상 진행이 되지 않음. `df -h` 로 확인결과 30GB 중 1.4GB가 남아있지만 2KB 인풋파일도 진행 안됨.</td>
  </tr>
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>테스트를 위해 파일들을 지워 %GB 정도 남게 만드니 실행되었다. 용량을 지우거나 새 인스턴스를 다시 만들 </p>
    </td>
  </tr>
</table>

<table>
  <tr>
    <th>날짜</th>
    <th>작성자</th>
    <th>제목</th> 
    <th>참조링크</th>
  </tr>
  <tr>
    <td>2018/08/11</td>
    <td>11기 김현우</td>
    <td>이클립스 메이븐 빌드(meaven build)가 되지 않을 때</td>
    <td></td>
  </tr>
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">[ERROR] error reading C:\Users\Steph\.m2\repository\org\apache\hadoop\hadoop-common\2.9.0\hadoop-common-2.9.0.jar; ZipFile invalid LOC header (bad signature)
      
      
[ERROR] error reading C:\Users\Steph\.m2\repository\org\apache\commons\commons-math3\3.1.1\commons-math3-3.1.1.jar; ZipFile invalid LOC header (bad signature)


[ERROR] error reading C:\Users\Steph\.m2\repository\org\apache\hadoop\hadoop-yarn-api\2.9.0\hadoop-yarn-api-2.9.0.jar; invalid CEN header (bad signature)


[ERROR] error reading C:\Users\Steph\.m2\repository\org\apache\hadoop\hadoop-hdfs\2.9.0\hadoop-hdfs-2.9.0.jar; ZipFile invalid LOC header (bad signature)


[ERROR] error reading C:\Users\Steph\.m2\repository\com\squareup\okhttp\okhttp\2.4.0\okhttp-2.4.0.jar; ZipFile invalid LOC header (bad signature)


[ERROR] error reading C:\Users\Steph\.m2\repository\io\netty\netty-all\4.0.23.Final\netty-all-4.0.23.Final.jar; ZipFile invalid LOC header (bad signature)

[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/TokenizerMapper.java:[1,1] cannot access com.ybigta.example.wordcount invalid stored block lengths


[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/WordCountDriver.java:[17,8] cannot access java.lang
  invalid stored block lengths
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/WordCountDriver.java:[17,38] cannot find symbol
  symbol: class Configured
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/WordCountDriver.java:[17,60] cannot find symbol
  symbol: class Tool
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/WordCountDriver.java:[19,29] cannot find symbol
  symbol:   class String
  location: class com.ybigta.example.wordcount.WordCountDriver
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/WordCountDriver.java:[19,51] cannot find symbol
  symbol:   class Exception
  location: class com.ybigta.example.wordcount.WordCountDriver
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/WordCountDriver.java:[25,20] cannot find symbol
  symbol:   class String
  location: class com.ybigta.example.wordcount.WordCountDriver
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/WordCountDriver.java:[25,42] cannot find symbol
  symbol:   class Exception
  location: class com.ybigta.example.wordcount.WordCountDriver
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[9,8] cannot access com.ybigta.example
  invalid stored block lengths
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[9,36] cannot find symbol
  symbol: class Reducer
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[9,44] cannot find symbol
  symbol: class Text
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[9,50] cannot find symbol
  symbol: class IntWritable
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[9,63] cannot find symbol
  symbol: class Text
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[9,69] cannot find symbol
  symbol: class IntWritable
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[10,13] cannot find symbol
  symbol:   class IntWritable
  location: class com.ybigta.example.wordcount.IntSumReducer
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[13,24] cannot find symbol
  symbol:   class Text
  location: class com.ybigta.example.wordcount.IntSumReducer
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[13,43] cannot find symbol
  symbol:   class IntWritable
  location: class com.ybigta.example.wordcount.IntSumReducer
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[13,64] cannot find symbol
  symbol:   class Context
  location: class com.ybigta.example.wordcount.IntSumReducer
  
  
[ERROR] /C:/Users/Steph/git/HadoopStudy/src/main/java/com/ybigta/example/wordcount/IntSumReducer.java:[14,20] cannot find symbol
  symbol:   class IOException
  location: class com.ybigta.example.wordcount.IntSumReducer
  
  
[INFO] 25 errors </td>
  </tr>
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>로컬 컴퓨터의 C드라이버 -> User(사용자) -> 사용자 계정(ex. Hyunwoo) -> .m2 -> repository에 들어가서 내부에 있는 것들을 모두 삭제한 후, 이클립스를 재실행하여 meaven build 다시 진행해보기</p>
    </td>
  </tr>
</table>

<table>
  <tr>
    <th>날짜</th>
    <th>작성자</th>
    <th>제목</th> 
    <th>참조링크</th>
  </tr>
  <tr>
    <td>2018/08/11</td>
    <td>11기 김현우</td>
    <td>hive를 실행시키고 SHOW DATABASES; 를 입력했는데 에러가 발생하는 경우</td>
    <td></td>
  </tr>
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">FAILED: SemanticException org.apache.hadoop.hive.ql.metadata.HiveException: java.lang.RuntimeException: Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient</td>
  </tr>
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>hive 종료</p>
      <p>cd hive</p>
      <p>./bin/hive --service metastore</p>
      <p>ctrl + z로 백그라운드 실행 시키기</p>
      <p>bg</p>
      <p>./bin/hive</p>
    </td>
  </tr>
</table>
