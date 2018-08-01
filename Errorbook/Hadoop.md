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
    <td></td>
  </tr>
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">[ERROR] Failed to execute goal on project hadoop-study: Could not resolve dependencies for project com.ybigta:hadoop-study:jar:0.0.1: Could not find artifact jdk.tools:jdk.tools:jar:1.8 at specified path C:\Program Files\Java\jre1.8.0_151/../lib/tools.jar -> [Help 1]
[ERROR] 
[ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR] 
[ERROR] For more information about the errors and possible solutions, please read the following articles:
[ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/DependencyResolutionException</td>
  </tr>
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>Window -> Preference 에서 jdk가 있는 경로를 추가해준다.</p>
    </td>
  </tr>
</table>



