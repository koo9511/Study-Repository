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
		//�ʿ� ��ü �߰�, ������ȣ�� Ű�� �����
		booksMap.put(book.getbNo(), book);
	}
	
	public void removeBook(String key){	
		//�ʿ��� ��ü ����
		booksMap.remove(key);
	}
	
	public String searchBook(String bTitle){
		//entrySet() ���
		//�������� ��ġ�ϴ� ��ü�� ������ȣ�� ����
		//�������� ��ü�� �ʿ� ������, null ������
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
		//������ ��� ��� : keySet() ���
		Iterator booksIter = booksMap.keySet().iterator();
		while(booksIter.hasNext()){
			System.out.println(booksMap.get(booksIter.next()));
		}
	}
	
	public Book[] sortedBookMap(){
		// �ش� ����������� �������������ؼ� ��ü�迭 ������
		List booksList = new ArrayList(booksMap.values());
		booksList.sort(new AscBookTitle());
		
		Book[] bar = new Book[booksList.size()];
		booksList.toArray(bar);
		
		return bar;
	}
	
	public void printBookMap(Book[] br){
		//��ü �迭 ���, for each �� ���
		for(Book b : br)
			System.out.println(b);
	}
	
	public void printBook(String key){
		System.out.println(booksMap.get(key));
	}
}
