<table>
  <tr>
      <th colspan="4">Hadoop</th>
  </tr>
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
    <td colspan="4">hadoop을 실행하고나서 jps를 커맨드라인에 입력했을 때 datanode가 없을 경우</td>
  </tr>
  <tr>
    <td colspan="4">
      <br>cd $HADOOP_HOME</br>
      <br>./sbin/stop-all.sh</br>
      <br>d $HOME</br>
      <br>rm -r data</br>
      <br>cd $HADOOP_HOME</br>
      <br>cd logs</br>
      <br>rm -r *</br>
      <br>cd ..</br>
      <br>hadoop namenode -format</br>
      <br>./sbin/start-all.sh</br>
    </td>
  </tr>

</table>
