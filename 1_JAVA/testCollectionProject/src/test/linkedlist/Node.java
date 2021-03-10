package test.linkedlist;

import test.list.Book;

public class Node {
	private Book data;  //데이터 필드
	private Node link;	 //링크 필드

	//constructor
	public Node() {}
	
	public Node(Book data) {
		this.data = data;
		this.link = null;
	}
	
	public Node(String title, int price) {
		this.data = new Book(title, price);
		this.link = null;
	}
	
	//getters and setters
	public Node getLink() {
		return this.link;
	}
	
	public void setLink(Node link) {
		this.link = link;
	}
	
	public Book getData() {
		return this.data;
	}
	
	public void setData(Book data) {
		this.data = data;
	}
	
	@Override
	public String toString() {
		//data 필드의 값 출력 확인용
		return data.toString();
	}
}









