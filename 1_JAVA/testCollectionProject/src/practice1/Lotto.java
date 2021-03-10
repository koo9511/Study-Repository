package practice1;

import java.util.*;

public class Lotto {
	public static void lottoDisplay() {
		TreeSet lottoNumbers = new TreeSet();
		Random r = new Random();
		
		while(true) {
			lottoNumbers.add(r.nextInt(45) + 1);  //autoBoxing
			if(lottoNumbers.size() == 6)
				break;
		}
		
		//방법 1.
		//public Object[] toArray() 임.
		Object[] array = lottoNumbers.toArray();
		System.out.println(array.length);
		//Object[] ---> int[] 로 바꿈
		int[] numbers = new int[array.length];
		for(int i = 0; i < array.length; i++) {
			numbers[i] = ((Integer)array[i]).intValue();
			//UnBoxing : 객체를 값으로 바꿈
		}
		
		//출력 확인
		for(int i = 0; i < numbers.length; i++)
			System.out.print(numbers[i] + "    ");
		System.out.println();
		
		//방법 2. 목록 이용
		Iterator numberIter = lottoNumbers.iterator();
		int[] numbers2 = new int[lottoNumbers.size()];
		int index = 0;
		while(numberIter.hasNext()) {
			//numbers2[index++] = ((Integer)numberIter.next()).intValue();
			//index++;
			
			//Auto UnBoxing : 객체 ---> 값
			numbers2[index++] = (int) numberIter.next();
		}
		
		//출력 확인
		for(int i = 0; i < numbers2.length; i++)
			System.out.print(numbers2[i] + "    ");
		System.out.println();
				
		
	}
	
	public static void main(String[] args) {
		// 컬렉션 실습문제 1
		lottoDisplay();
	}

}
