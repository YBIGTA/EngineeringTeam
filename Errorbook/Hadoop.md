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
    <td>maven 빌드를 처음 하려고하는데 jdk관련 오류가 발생할 때</td>
    <td></td>
  </tr>
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">HadoopStudy를 clone하고 maven 빌드를 하려고하는데, jdk관련 에러가 발생할 때,</td>
  </tr>
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>Window -> Preference 에서 jdk가 있는 경로를 추가해준다.</p>
    </td>
  </tr>
</table>



