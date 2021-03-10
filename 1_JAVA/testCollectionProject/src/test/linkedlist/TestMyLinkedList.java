package test.linkedlist;

import test.list.Book;

public class TestMyLinkedList {

	public static void main(String[] args) {
		// Book 객체를 링크드리스트 자료구조로 저장 처리하는
		// MyLinkedList 테스트용
		MyLinkedList linkList = new MyLinkedList();
		System.out.println("현재 연결된 노드 수 : " + linkList.getNodeCount());

		linkList.add(new Node(new Book("오라클정복", 38000)));
		System.out.println("현재 연결된 노드 수 : " + linkList.getNodeCount());
		linkList.add(new Node("자바정복", 25000));
		System.out.println("현재 연결된 노드 수 : " + linkList.getNodeCount());
	
		linkList.printAll();
	}

}










