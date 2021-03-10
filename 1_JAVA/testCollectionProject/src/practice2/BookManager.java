package practice2;

import java.util.*;

public class BookManager {
	private ArrayList bookList;
	
	public BookManager(){
		bookList = new ArrayList();
	}
	
	public BookManager(ArrayList bookList){
		this.bookList = new ArrayList(bookList);
	}

	public void addBook(Book book) {
		//리스트에 객체 추가
		bookList.add(book);
	}

	public Book[] sortedBookList() {
		// 해당 카테고리순 오름차순정렬해서 객체배열 리턴함
		bookList.sort(new AscCategory());
		Book[] bar = new Book[bookList.size()];
		bookList.toArray(bar);
		return bar;
	}

	public void printBookList(Book[] books) {
		//객체 배열 출력, for each 문 사용
		for(Book b : books)
			System.out.println(b);
	}

	public void deleteBook(int index) {
		//리스트에서 객체 제거
		bookList.remove(index);
	}

	public int searchBook(String bookTitle) {
		//도서명이 일치하는 객체를 찾아 해당 인덱스를 리턴
		//도서명이 일치하는 객체가 리스트에 없으면, -1 리턴함
		int result = -1;
		
		for(int i = 0; i < bookList.size(); i++){
			if(((Book)bookList.get(i)).getTitle().equals(bookTitle) == true){
				result = i;
				break;
			}
		}
		
		return result;
	}

	public void displayAll() {
		//목록정보 모두 출력
		for(int i = 0; i < bookList.size(); i++)
			System.out.println(bookList.get(i));
	}

	public void printBook(int index) {
		//인덱스 위치의 객체의 정보를 출력함
		System.out.println(bookList.get(index));
	}
}
