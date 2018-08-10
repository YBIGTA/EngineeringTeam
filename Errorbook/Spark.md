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
    <td>jupyter에서 sc를 실행시켰는데 ''라고 나올 때</td>
    <td></td>
  </tr>
  
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">hadoop, (hive), pyspark를 실행한 후, jupyter에서 sc를 실행시켰더니 sc가 생성되지 않을 때</td>
  </tr>
  
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>sc = SparkContext.getOrCreate()를 실행시킨 후 sc확인 해보기</p>
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
    <td>2018/07/11</td>
    <td>11기 김현우</td>
    <td>https://{ip주소}:{포트}로 jupyter가 접속이 안되는 경우</td>
    <td></td>
  </tr>
  
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">https://{ip주소}:{포트}로 jupyter가 접속이 안되는 경우</td>
  </tr>
  
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>인스턴스의 포트가 현재 나의 ip로 열려있는지 확인해본다.</p>
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
    <td>spark설치 과정 중에 jupyter notebook, pyspark가 실행되지 않는 경우</td>
    <td></td>
  </tr>
  
  <tr>
    <th>로그 혹은 상황설명</th>
    <td colspan="3">Command not found</td>
  </tr>
  
  <tr>
    <th>해결방법</th>
    <td colspan="3">
      <p>.bash_profile.sh 파일을 source 해준다.</p>
      <p>source ~/.bash_profile.sh</p>
    </td>
  </tr>
</table>
