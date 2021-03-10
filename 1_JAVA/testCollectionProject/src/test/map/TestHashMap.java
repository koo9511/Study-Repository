package test.map;

import java.util.*;

public class TestHashMap {

	public static void main(String[] args) {
		// Map 계열 클래스 테스트
		//Map hmap = new HashMap();
		//Object hmap = new HashMap();
		//AbstractMap hmap = new HashMap();
		HashMap hmap = new HashMap();
		
		//저장시 키객체와 값객체 두 개를 쌍으로 저장해야 됨.
		hmap.put("user001", "홍길동");
		hmap.put(100, "김철수");  //auto Boxing
		System.out.println(hmap/*.toString()*/);
		
		//key 는 Set 구조,  value 는 List 구조로 저장됨
		hmap.put("one", "java program");
		hmap.put("two", "java");
		hmap.put("one", "oracle");
		System.out.println(hmap);
		
		hmap.put("three", "java");
		System.out.println(hmap);
		
		//저장된 객체 조회시
		System.out.println(hmap.get("one"));
		
		System.out.println("-------------------------------------");
		//맵에 저장된 객체에 대한 연속 처리를 하고자 할 경우
		//기본적으로 제공되는 메소드 없음
		//해결방법 1.
		//저장된 키들만 Set 으로 바꿈 : keySet() 사용
		Set keys = hmap.keySet();
		//키들에 대한 목록 만들기 할 수 있음. iterator() 사용함
		Iterator keyIter = keys.iterator();
		while(keyIter.hasNext()) {
			//키목록에서 키를 하나 추출
			Object key = keyIter.next();
			Object value = hmap.get(key);
			System.out.println(key + "=" + value);
		}
		System.out.println("------------------------------------");
		//해결방법 2.
		//값 객체들만 Collection 으로 바꿈 : values() 사용.
		//목록만들기 또는 객체배열로 바꿈
		Collection values = hmap.values();
		//2-1. 목록만들기
		Iterator valueIter = values.iterator();
		while(valueIter.hasNext()) {
			System.out.println(valueIter.next());
		}
		System.out.println("2-2. ------------------------------");
		//2-2. 객체배열로 바꾸어 연속 처리
		Object[] valueArray = values.toArray();
		for(int i = 0; i < valueArray.length; i++) {
			System.out.println(valueArray[i]);
		}
		
		System.out.println("3. ------------------------------");
		//해결방법 3. 
		//엔트리(키와 값 한쌍)들을 Set 으로 바꿈 : entrySet() 사용.
		//바뀐 엔트리 Set 을 목록화 처리함 : iterator() 사용
		Set entrySet = hmap.entrySet();
		Iterator entryIter = entrySet.iterator();
		while(entryIter.hasNext()) {
			Map.Entry entry = (Map.Entry)entryIter.next();
			Object key = entry.getKey();
			Object value = entry.getValue();
			System.out.println(key + "=" + value);
		}
		
	}

}

class Outer{
	//Field
	private int value;
	
	//Constructor
	public Outer() {}
	
	public Outer(int value) {
		this.value = value;
	}
	
	//Method
	public void printValue() {
		System.out.println("value : " + value);
	}
	
	//내부클래스 : Inner(Nested) class
	//외부클래스의 멤버가 됨
	//접근제한자나 예약어를 필드나 메소드에 사용한 것과
	//동일하게 사용할 수 있음.
	private class Inner {
		private Outer.Inner oi;
		private Outer.Inner3 oi3;
		private TFace.InTF samp;
	}
	
	protected class Inner2 {}
	
	public static class Inner3 {}
}

interface TFace {
	public static interface InTF {}
}











