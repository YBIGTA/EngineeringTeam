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
    <td>[http://paranwater.tistory.com/369](http://paranwater.tistory.com/369)</td>
  </tr>
  <tr>
    <td colspan="4">hadoop을 실행하고나서 jps를 커맨드라인에 입력했을 때 datanode가 없을 </td>
  </tr>
  <tr>
    <td colspan="4">
      - cd $HADOOP_HOME
      - ./sbin/stop-all.sh
      - cd $HOME
      - rm -r data
      - cd $HADOOP_HOME
      - cd logs
      - rm -r *
      - cd ..
      - hadoop namenode -format
      - ./sbin/start-all.sh
    </td>
  </tr>

</table>
