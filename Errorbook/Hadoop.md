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
    <td>로그</td>
    <td>로그는 복사하지 못했습니다.</td>
  </tr>
  <tr>
    <td>해결법</td>
    <td>
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
