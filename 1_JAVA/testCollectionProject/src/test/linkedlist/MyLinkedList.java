package test.linkedlist;

public class MyLinkedList {
	//자료구조 연결리스트(LinkedList)방식으로
	//객체를 추가/삭제/수정/조회/검색/정렬 처리할 클래스임.
	
	//Field	
	private Node head;  //첫 노드의 주소 저장용
	private Node move;  //노드간 이동용 레퍼런스
	private int nodeCount;  //연결된 노드 갯수 카운트용
	
	//Constructor
	public MyLinkedList() {}
	
	//Method
	//뒤쪽으로 새 노드를 추가하는 메소드
	public void add(Node newNode) {
		//첫번째 노드 추가일 때
		if(head == null && nodeCount == 0) {
			head = newNode;
		}else { //첫번째 노드 추가가 아닐 때
			move = head;
			//move 레퍼런스가 현재 마지막 노드를 참조하도록 처리함
			for(int m = 1; m < nodeCount; m++) {
				move = move.getLink();
			}
			//마지막 노드의 링크필드에 추가할 새 노드의 주소 기록함
			move.setLink(newNode);
		}
		
		nodeCount++;
	}
	
	//연결된 모든 노드 정보 출력용
	public void printAll() {
		move = head;
		for(int m = 1; m <= nodeCount; m++) {
			if(move.getLink() != null)
				System.out.println(move + ", link : " + move.getLink().hashCode());
			else
				System.out.println(move + ", link : " + move.getLink());
			
			move = move.getLink();
		}
	}
	
	//현재 연결된 노드 갯수 리턴
	public int getNodeCount() {
		return this.nodeCount;
	}
}










