package test.map;

import java.util.*;

public class TestHashMap2 {

	public static void main(String[] args) {
		//�ʿ� Ű�� 1~100������ ������ ������ ����ϰ�,
		//���� ���������� ��� ����ó��
		//5�� ����
		HashMap hmap = new HashMap();
		Random r = new Random();
		
		for(int k = 1; k < 6; k++) {
			hmap.put(r.nextInt(100) + 1, Math.random());
		}
		
		System.out.println(hmap);

		//Ű�� ���� ������������ó���� ���ϸ�
		TreeMap tmap = new TreeMap(hmap);
		System.out.println(tmap);
		System.out.println("=========================");
		
		//���� ����� ��ü������ �ϳ��� ����ó���ϴ� ��� ����.
		//����� ��ü �ϳ��� ������ �۾��� ���� ó���Ϸ���...
		//1. keySet() �̿�
		Set keys = tmap.keySet();
		Iterator keyList = keys.iterator();
		while(keyList.hasNext()){
			Object keyObj = keyList.next();		//��Ͽ��� Ű �Ѱ� ����
			Object valueObj = tmap.get(keyObj);	//������ Ű�� �̿��� �� ����
			System.out.println(keyObj + " : " + valueObj);
		}
		System.out.println("=========================");
		
		//2. values() �̿�
		Collection values = tmap.values();
		Object[] objArray = values.toArray();
		for(int i = 0; i < objArray.length; i++)  //using for loop
			System.out.println(objArray[i]);
		System.out.println();
		
		for(Object obj : objArray)		//using for each
			System.out.println(obj);
		System.out.println("======================");
		
		//3. entrySet() �̿�
		Set mapset = tmap.entrySet();		//entrySet �����
		Iterator mapList = mapset.iterator();
		while(mapList.hasNext()){
			Map.Entry map = (Map.Entry)mapList.next();
			System.out.println(map.getKey() + " : " + 
										map.getValue());
		}
	}

}








