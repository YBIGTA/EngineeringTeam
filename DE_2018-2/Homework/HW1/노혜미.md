# The Hadoop Distributed File System



# 1. INTRODUCTION AND RELATED WORK

- 하둡의 중요한 특성은 데이터를 분할하고 수 많은 호스트에 걸친 연산, 병렬적으로 application 계산을 수행하는 것이다.
- HDFS는 파일 시스템의 메타 데이터와 application data를 따로 저장한다. NameNode에 metadata를 저장하고 application data는 DataNode들에 저장한다.



# 2.  ARCHITECTURE

###  A. NameNode

- HDFS namespace는 파일과 디렉토리의 구조이다.
- 파일의 내용은 커다란 블록들로 나누어져 있고 각각의 블록은 다양한 DataNode들에 의존적으로 복제돼있다.
- NameNode는 namespace tree와  파일 블록들을 DataNode들에 mapping 시키는 것을  유지한다.
- 파일을 읽기 원하는 HDFS 클라이언트는 먼저  data block들의 위치를 알기 위해 NameNode와 접촉하고 클라이언트와 가장 가까이 있는 DataNode로 부터 블록의 내용을 읽는다.
- 데이터를 쓸 때, 클라이언트는 NameNode가 블록의 복제본을 저장할 세 개의 DataNode를 지정할 것을 요청한다.



### B. DataNodes

- DataNode 상의 각각의 블록 복제본은 로컬 호스트의 native 파일 시스템 안에 두 개의 파일들로 나타내진다. 첫번째 파일은 데이터 자체를 가지고 두번째 파일은 블록의 메타 데이터이다.
- namespace ID는 클러스터의 모든 노드들 상에 영구적으로 저장된다. 다른 namespace ID를 가진 Node들은 같은 클러스터가 될 수 없다.
- DataNode들은 영구적으로 고유의 storage ID를 저장한다. storage ID는 DataNode의 내부적인 구분자이고 처음으로 NameNode에 등록할 때 배정된 뒤, 그 후로 절대 변하지 않는다.
- 일반적인  연산동안 DataNode들은 DataNode가 연산을 수행하고 있고 블록 본제본이 이용가능한지 확신하기 위해 NameNode에 heartbeats를 보낸다. 만약 NameNode가 수십분 이내로 heartbeats를 받지 못한다면, NameNode는 DataNode가 service에서 벗어난 것으로 생각하고 해당 DataNode가 가지고 있던 블록 본제본은 사용할 수 없게 된다. 그래서 NameNode는 다른 DataNode에 해당 블록들의 새로운 복제본을 만들 것을 스케줄링한다.



### C.  HDFS Client

- application이 파일을 읽을 때, HDFS 클라이언트는 NameNode에게 블록의 복제본들을 가지고 있는 DataNode들의 리스트를 요청한다. 그 다음 DataNode와 직접적으로 접촉하고 원하는 블록의 교환을 요청한다.
- 전통적인 파일 시스템과 달리, HDFS는 파일 블록들의 위치를 노출시키는 API를 제공한다. 이와 같은 시스템은 MapReduce framework 같은 application들이 태스크를 스케줄링할 수 있도록 해준다. 그래서 읽기 성능이 향상된다.



###  D. Image and Journal

- namespace image는 디렉토리와 파일로서 application 데이터의 구성을 묘사하는 파일 시스템 메타 데이터이다.
- 디스크에 쓰여지는 영구적인 이미지의 기록을 checkpoint라고 한다.
- journal은 영구적으로 유지돼야 하는 파일 시스템에 가해지는 변화를 위한 write-ahead commit log이다.
- 시작하는 동안 NameNode는 checkpoint로부터 namespace image를 초기화한다. 그리고 image가 최신의 상태가 될 때까지 journal로부터 변화를 다시 수행한다.
- 중요한 정보를 보존하기 위해서 HDFS는 다양한 저장 디렉토리들에 checkpoint와 journal을 저장하도록 설정될 수 있다.



### E. CheckpointNode

- CheckpointNode는 새로운 checkpoint와 빈 journal을 만들기위해 주기적으로 존재하는 checkpoint와 journal을 결합한다.
- 주기적인 checkpoint들을 만드는 것은 파일 시스템 메타 데이터를 보호하는 한 가지 방법이다.



### F. BackupNode

- BackupNode는 주기적인 checkpoint들을 만들 수 있고, 또한 메모리 내재적이면서 최신의 파일 시스템 namespace image를  유지할 수 있다. 
- BackupNode는 읽기 전용의 NameNode로 보여질 수 있다. 블록의 위치를 제외한 모든 파일 시스템 메타 데이터를 포함한다.



### G. Upgrades, File System Snapshots

- HDFS에서 스냅샷을 만드는 목적은 업그레이드 동안 시스템에 저장되는 데이터의 잠재적인 손실을 최소화하는 것이다.
- 스냅샷 메카니즘은 administrator가 지속적으로 파일 시스템의 현재 상태를 저장하도록 한다. 그래서 만약 업그레이드의 결과에 데이터 손실 혹은 손상이 있다면, 업그레이드를 rollback하는 게 가능하고 namespace에 HDFS를 반환하고 스냅샷의 상태를 저장할 수 있다.



# 3. FILE I/O OPERATIONS AND REPLICA MANGEMENT

###  A. File Read and Write

- HDFS는 single-writer, multiple-reader 모델을 구현한다.
- 쓰기를 위해 파일을 여는 HDFS 클라이언트는 파일에 대한 권리를 부여받는다. 즉, 다른 클라이언트는 파일에 쓸 수 없다.  쓰기 권한이 있는 클라이언트는 NameNode에 heartbeat를 보냄으로써 권리를 주기적으로 갱신한다. 만약 파일이 닫힌다면, 권리는 취소된다.
- 쓰기 권리는 다른 클라이언트가 파일을 읽지 못하도록 하는 것은 아니다. 즉, 하나의 파일은 다수이면서 동시의 읽기 클라이언트를 가진다.
- HDFS는 각각의 데이터 블록에 대한 checksum을 만들고 저장한다.
- 클라이언트가 HDFS 파일을 만들 때, HDFS는 각각의 블록에 대한 checksum sequence를 계산하고 데이터와 함께 DataNode에 이것을 보낸다.
- 클라이언트는 받은 데이터에 대한 checksum을 계산하고 새로 계산된 checksum들이 받은 checksum들과 일치하는지 검증한다. 만약 일치하지 않는다면, 클라이언트는 복제본의 손상을 NameNode에 알리고 또 다른 DataNode로부터 블록의 다른 복제본을 가져온다.
- 블록의 내용을 읽을 때, 클라이언트는 먼저 가장 가까이에 있는 복제본을 가져오려고 한다. 만약 실패한다면 sequence에서 다음에 있는 복제본을 가져오려고 시도한다.
- HDFS I/O의 디자인은 특히 MapReduce와 같은 batch processing system들에 최적화돼있다.




### B. Block Placement

- rack의 노드들은 switch를 공유하고 rack switch들은 하나 이상의 core switch들에 의해 연결돼 있다.  서로 다른 랙에 있는 두 노드 사이의 communication은 다수의 switch들을 거쳐야한다.
- NameNode는 각각의 DataNode의 rack의 위치를 결정하는 주요한 곳이다. DataNode가 NameNode에 등록할 때, NameNode는 노드가 어떤 rack에 속해야 하는지 결정하기 위해 configured script를 실행한다.
- 새로운 블록이 만들어졌을 때, HDFS는 writer가 있는 곳에 첫번째 복사본을 위치시킨다. 두번째와 세번째 복제본은 다른 rack의 다른 node에 위치하고 나머지는 최대한 겹치지 않게 랜덤한 노드에 위치된다.



### C. Replication management

- 블록이 과도하게 복제되면, NameNode는 삭제할 복제본을 고른다. 만약 반대로 블록이 덜 복제된다면, 이 블록은 replication priority queue에 넣어지게 된다. 하나의 복제본만을 가진 블록이 제일 높은 우선순위를 가진다. background thread는 새로운 복제본들을 어디에 위치시킬지 결정하기 위해 replication queue의 헤드를 주기적으로 스캔한다.



### D. Balancer

- balancer는 HDFS 클러스터상에서 디스크 사용량의 균형을 맞추는 도구이다. DataNode들을 높은 활용량을 가지는 것부터 낮은 활용량을 가지는 순으로 복제본들을 반복적으로 이동시킨다.



### E. Block Scanner

- block scanner는 주기적으로 DataNode의 블록 복제본들을 스캔하고 저장된 checksum들이 block data와 맞는지 확인한다. 그래서 각각의 DataNode는 block scanner를 실행한다.
- read client 혹은 block scanner가 손상된 블록을 발견할때마다, NameNode에 이를 알린다. NameNode는 복제본을 손상된 것으로 체크하고 곧바로 복제본을 버리는 대신 블록의 카피를 복제한다. 



### F. Decommissioning

- cluster administrator는 노드들의 호스트 주소를 목록화함으로써 어느 노드들이 클러스터에 참여할 수 있는지 구체화한다.
- 클러스터의 현재 멤버가 decommissioning된 걸로 마크된다면 클러스터에서 제외된다. 
- DataNode가 decommisioning된 걸로 마크된다면, 해당 DataNode는 복제본을 위치시키는 장소로 선택될 수 없다. 하지만 읽기 요청에 대해서는 계속 수행할 수 있다.



### G. Inter-Cluster Data Copy

- HDFS는 DistCp라고 불리는 큰 내부 클러스터 평행 카피를 제공한다. 이것은 MapReduce job이다. 각각의 map task들은 소스 데이터의 일부분을 도착 파일 시스템으로 복사한다.