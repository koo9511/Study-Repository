package test.set;

import java.util.*;

public class SetSample {
	public SetSample() {}
	
	public void testHashSet() {
		HashSet hset = new HashSet();
		
		System.out.println("size : " + hset.size());
		System.out.println("isEmpty ? " + hset.isEmpty());
		
		hset.add(new Integer(120));
		hset.add(new Boolean(true));
		hset.add(new Double(32.5));
		hset.add(new Character('A'));
		//data ---> Object : Boxing (Wrapper 클래스 사용)
		
		System.out.println(hset/*.toString()*/);
		//저장 순서는 유지 안 됨
		
		hset.add(new Integer(120));
		//중복 저장 허용 안 함
		System.out.println(hset);
		
		//저장된 객체 삭제
		hset.remove(new Boolean(true));
		System.out.println(hset);
		
		//저장된 객체 수 확인
		System.out.println("현재 저장된 객체수 : " + hset.size());
	
		//저장 공간 비우기
		hset.clear();
		System.out.println("비워졌는가? " + hset.isEmpty());
		System.out.println("현재 저장된 객체수 : " + hset.size());
	}
	
	public void testHashSet2() {
		HashSet hset = new HashSet();
		
		hset.add("apple");
		hset.add(1250);  //autoBoxing : data --> Object 자동처리됨
		hset.add(0.75);
		hset.add('A');
		
		System.out.println(hset);
		
		//Set 에 저장된 객체를 하나씩 꺼내려면
		//저장된 객체정보를 목록 만들기 함 : iterator() 사용
		//Iterator 인터페이스가 객체 목록을 의미함
		Iterator iter = hset.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
	}
	
	public void testTreeSet() {
		//TreeSet : 중복 저장 안됨. 
		//자동 오름차순 정렬 기능이 내장되어 있음
		//단, 같은 종류의 객체들로만 저장되었을 때 유용함.
		TreeSet tset = new TreeSet();
		
		tset.add("grape");
		tset.add("banana");
		tset.add("apple");
		tset.add("melon");
		tset.add("orange");
		
		System.out.println(tset);
		
		tset.add("apple");
		System.out.println(tset);
		
		//목록을 이용해서 하나씩 꺼내기
		Iterator iter = tset.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
		
		//내림차순정렬된 결과를 원할 경우
		//Set descSet = tset.descendingSet();
		NavigableSet descSet = tset.descendingSet();
		System.out.println(descSet);
		
		//내림차순정렬된 목록을 만든다면
		Iterator descIter = tset.descendingIterator();
		while(descIter.hasNext()) {
			System.out.println(descIter.next());
		}
		
	}
	
	public void testLinkedHashSet() {
		//LinkedHashSet : 중복 저장 안 함.
		//저장순서가 유지됨.
		LinkedHashSet lhset = new LinkedHashSet();
		
		lhset.add("apple");
		lhset.add(120);
		lhset.add(52.3);
		lhset.add('B');
		
		System.out.println(lhset);
		
		Iterator iter = lhset.iterator();
		while(iter.hasNext())
			System.out.println(iter.next());
	}
}









