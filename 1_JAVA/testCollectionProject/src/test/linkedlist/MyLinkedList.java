package test.linkedlist;

public class MyLinkedList {
	//�ڷᱸ�� ���Ḯ��Ʈ(LinkedList)�������
	//��ü�� �߰�/����/����/��ȸ/�˻�/���� ó���� Ŭ������.
	
	//Field	
	private Node head;  //ù ����� �ּ� �����
	private Node move;  //��尣 �̵��� ���۷���
	private int nodeCount;  //����� ��� ���� ī��Ʈ��
	
	//Constructor
	public MyLinkedList() {}
	
	//Method
	//�������� �� ��带 �߰��ϴ� �޼ҵ�
	public void add(Node newNode) {
		//ù��° ��� �߰��� ��
		if(head == null && nodeCount == 0) {
			head = newNode;
		}else { //ù��° ��� �߰��� �ƴ� ��
			move = head;
			//move ���۷����� ���� ������ ��带 �����ϵ��� ó����
			for(int m = 1; m < nodeCount; m++) {
				move = move.getLink();
			}
			//������ ����� ��ũ�ʵ忡 �߰��� �� ����� �ּ� �����
			move.setLink(newNode);
		}
		
		nodeCount++;
	}
	
	//����� ��� ��� ���� ��¿�
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
	
	//���� ����� ��� ���� ����
	public int getNodeCount() {
		return this.nodeCount;
	}
}










