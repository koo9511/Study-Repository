package test.linkedlist;

import test.list.Book;

public class TestMyLinkedList {

	public static void main(String[] args) {
		// Book ��ü�� ��ũ�帮��Ʈ �ڷᱸ���� ���� ó���ϴ�
		// MyLinkedList �׽�Ʈ��
		MyLinkedList linkList = new MyLinkedList();
		System.out.println("���� ����� ��� �� : " + linkList.getNodeCount());

		linkList.add(new Node(new Book("����Ŭ����", 38000)));
		System.out.println("���� ����� ��� �� : " + linkList.getNodeCount());
		linkList.add(new Node("�ڹ�����", 25000));
		System.out.println("���� ����� ��� �� : " + linkList.getNodeCount());
	
		linkList.printAll();
	}

}










