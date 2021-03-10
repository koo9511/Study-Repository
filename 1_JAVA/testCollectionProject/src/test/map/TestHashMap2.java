package test.map;

import java.util.*;

public class TestHashMap2 {

	public static void main(String[] args) {
		//맵에 키는 1~100사이의 임의의 정수를 사용하고,
		//값은 랜덤값으로 기록 저장처리
		//5개 저장
		HashMap hmap = new HashMap();
		Random r = new Random();
		
		for(int k = 1; k < 6; k++) {
			hmap.put(r.nextInt(100) + 1, Math.random());
		}
		
		System.out.println(hmap);

		//키에 대한 오름차순정렬처리를 원하면
		TreeMap tmap = new TreeMap(hmap);
		System.out.println(tmap);
		System.out.println("=========================");
		
		//맵은 저장된 객체정보를 하나씩 연속처리하는 기능 없음.
		//저장된 객체 하나씩 꺼내는 작업은 연속 처리하려면...
		//1. keySet() 이용
		Set keys = tmap.keySet();
		Iterator keyList = keys.iterator();
		while(keyList.hasNext()){
			Object keyObj = keyList.next();		//목록에서 키 한개 추출
			Object valueObj = tmap.get(keyObj);	//추출한 키를 이용해 값 추출
			System.out.println(keyObj + " : " + valueObj);
		}
		System.out.println("=========================");
		
		//2. values() 이용
		Collection values = tmap.values();
		Object[] objArray = values.toArray();
		for(int i = 0; i < objArray.length; i++)  //using for loop
			System.out.println(objArray[i]);
		System.out.println();
		
		for(Object obj : objArray)		//using for each
			System.out.println(obj);
		System.out.println("======================");
		
		//3. entrySet() 이용
		Set mapset = tmap.entrySet();		//entrySet 적용됨
		Iterator mapList = mapset.iterator();
		while(mapList.hasNext()){
			Map.Entry map = (Map.Entry)mapList.next();
			System.out.println(map.getKey() + " : " + 
										map.getValue());
		}
	}

}








