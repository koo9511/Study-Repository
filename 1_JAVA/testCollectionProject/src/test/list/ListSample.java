package test.list;

import java.util.*;

public class ListSample {
	public ListSample() {}
	
	public void testArrayList() {
		ArrayList alist = new ArrayList();
		//List alist = new ArrayList();
		//Collection alist = new ArrayList();
		
		System.out.println("isEmpty() : " + alist.isEmpty());
		System.out.println("size : " + alist.size());
		
		//객체만 저장함
		//List 계열은 저장되는 순서가 유지됨.
		//순번(index) 을 사용함
		alist.add(new String("grape"));
		alist.add("orange");  //auto Boxing
		alist.add(new Integer(12345));
		alist.add(753);  //기본자료형에 대해서만 auto boxing 됨.
		
		System.out.println(alist.toString());
		
		alist.add(new Book("자바마스터", 28000));
		
		System.out.println(alist);
		
		alist.add(2, "java");
		System.out.println(alist);
		
		System.out.println("저장된 객체수 : " + alist.size());
	
		//index 를 이용해서 하나씩 꺼낼 수 있음
		for(int i = 0; i < alist.size(); i++) {
			System.out.println(i + " : " + alist.get(i));
		}
		
		//순번을 이용해서 원하는 대상을 변경할 수도 있음
		alist.set(2, new Date());
		System.out.println(alist);
		
		//삭제
		alist.remove(2);
		System.out.println(alist);
		alist.remove("grape");
		System.out.println(alist);
		
		//리스트를 객체배열로 바꾸기
		Object[] objArray = alist.toArray();
		for(Object obj : objArray) {
			System.out.println(obj);
		}
		
		//리스트를 목록 만들어서 연속 처리할 경우
		Iterator listIter = alist.iterator();
		while(listIter.hasNext()) {
			System.out.println(listIter.next());
		}
	}
	
	public void testSort() {
		//List 계열에서는 객체 정렬에 sort() 메소드 사용할 수 있음.
		ArrayList bookList = new ArrayList();
		
		bookList.add(new Book("자바의 정석", 30000));
		bookList.add(new Book("오라클", 45000));
		bookList.add(new Book("기적의 개발자!", 20000));
		
		System.out.println(bookList);
		
		System.out.println("도서제목 기준 오름차순정렬 결과 확인");
		bookList.sort(new BookTitleAscending());
		System.out.println(bookList);
		
		System.out.println("도서가격 기준 내림차순정렬 결과 확인");
		bookList.sort(new BookPriceDescending());
		System.out.println(bookList);
	}
}













