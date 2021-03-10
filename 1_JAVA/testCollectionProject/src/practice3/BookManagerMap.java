package practice3;

import java.util.*;
import practice2.Book;

public class BookManagerMap {
	private HashMap booksMap;
	
	public BookManagerMap(){
		booksMap = new HashMap();
	}
	
	public BookManagerMap(HashMap map){
		booksMap = new HashMap(map);
	}
	
	public void putBook(Book book){	
		//맵에 객체 추가, 도서번호를 키로 사용함
		booksMap.put(book.getbNo(), book);
	}
	
	public void removeBook(String key){	
		//맵에서 객체 제거
		booksMap.remove(key);
	}
	
	public String searchBook(String bTitle){
		//entrySet() 사용
		//도서명이 일치하는 객체의 도서번호를 리턴
		//도서명이 객체가 맵에 없으면, null 리턴함
		String key = null;
		
		Set mset = booksMap.entrySet();
		Iterator booksIter = mset.iterator();
				
		while(booksIter.hasNext()){
			Map.Entry entry = (Map.Entry)booksIter.next();
			String k = (String)entry.getKey();
			Book b = (Book)entry.getValue();
			
			if(b.getTitle().equals(bTitle) == true) {	
				key = k;
				break;
			}
		}
		
		return key;
	}
		
	public void displayAll(){
		//맵정보 모두 출력 : keySet() 사용
		Iterator booksIter = booksMap.keySet().iterator();
		while(booksIter.hasNext()){
			System.out.println(booksMap.get(booksIter.next()));
		}
	}
	
	public Book[] sortedBookMap(){
		// 해당 도서명순으로 오름차순정렬해서 객체배열 리턴함
		List booksList = new ArrayList(booksMap.values());
		booksList.sort(new AscBookTitle());
		
		Book[] bar = new Book[booksList.size()];
		booksList.toArray(bar);
		
		return bar;
	}
	
	public void printBookMap(Book[] br){
		//객체 배열 출력, for each 문 사용
		for(Book b : br)
			System.out.println(b);
	}
	
	public void printBook(String key){
		System.out.println(booksMap.get(key));
	}
}
