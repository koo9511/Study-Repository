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
		
		//��� 1.
		//public Object[] toArray() ��.
		Object[] array = lottoNumbers.toArray();
		System.out.println(array.length);
		//Object[] ---> int[] �� �ٲ�
		int[] numbers = new int[array.length];
		for(int i = 0; i < array.length; i++) {
			numbers[i] = ((Integer)array[i]).intValue();
			//UnBoxing : ��ü�� ������ �ٲ�
		}
		
		//��� Ȯ��
		for(int i = 0; i < numbers.length; i++)
			System.out.print(numbers[i] + "    ");
		System.out.println();
		
		//��� 2. ��� �̿�
		Iterator numberIter = lottoNumbers.iterator();
		int[] numbers2 = new int[lottoNumbers.size()];
		int index = 0;
		while(numberIter.hasNext()) {
			//numbers2[index++] = ((Integer)numberIter.next()).intValue();
			//index++;
			
			//Auto UnBoxing : ��ü ---> ��
			numbers2[index++] = (int) numberIter.next();
		}
		
		//��� Ȯ��
		for(int i = 0; i < numbers2.length; i++)
			System.out.print(numbers2[i] + "    ");
		System.out.println();
				
		
	}
	
	public static void main(String[] args) {
		// �÷��� �ǽ����� 1
		lottoDisplay();
	}

}
