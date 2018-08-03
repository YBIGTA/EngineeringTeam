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



