package test.map;

import java.util.*;

public class TestHashMap {

	public static void main(String[] args) {
		// Map �迭 Ŭ���� �׽�Ʈ
		//Map hmap = new HashMap();
		//Object hmap = new HashMap();
		//AbstractMap hmap = new HashMap();
		HashMap hmap = new HashMap();
		
		//����� Ű��ü�� ����ü �� ���� ������ �����ؾ� ��.
		hmap.put("user001", "ȫ�浿");
		hmap.put(100, "��ö��");  //auto Boxing
		System.out.println(hmap/*.toString()*/);
		
		//key �� Set ����,  value �� List ������ �����
		hmap.put("one", "java program");
		hmap.put("two", "java");
		hmap.put("one", "oracle");
		System.out.println(hmap);
		
		hmap.put("three", "java");
		System.out.println(hmap);
		
		//����� ��ü ��ȸ��
		System.out.println(hmap.get("one"));
		
		System.out.println("-------------------------------------");
		//�ʿ� ����� ��ü�� ���� ���� ó���� �ϰ��� �� ���
		//�⺻������ �����Ǵ� �޼ҵ� ����
		//�ذ��� 1.
		//����� Ű�鸸 Set ���� �ٲ� : keySet() ���
		Set keys = hmap.keySet();
		//Ű�鿡 ���� ��� ����� �� �� ����. iterator() �����
		Iterator keyIter = keys.iterator();
		while(keyIter.hasNext()) {
			//Ű��Ͽ��� Ű�� �ϳ� ����
			Object key = keyIter.next();
			Object value = hmap.get(key);
			System.out.println(key + "=" + value);
		}
		System.out.println("------------------------------------");
		//�ذ��� 2.
		//�� ��ü�鸸 Collection ���� �ٲ� : values() ���.
		//��ϸ���� �Ǵ� ��ü�迭�� �ٲ�
		Collection values = hmap.values();
		//2-1. ��ϸ����
		Iterator valueIter = values.iterator();
		while(valueIter.hasNext()) {
			System.out.println(valueIter.next());
		}
		System.out.println("2-2. ------------------------------");
		//2-2. ��ü�迭�� �ٲپ� ���� ó��
		Object[] valueArray = values.toArray();
		for(int i = 0; i < valueArray.length; i++) {
			System.out.println(valueArray[i]);
		}
		
		System.out.println("3. ------------------------------");
		//�ذ��� 3. 
		//��Ʈ��(Ű�� �� �ѽ�)���� Set ���� �ٲ� : entrySet() ���.
		//�ٲ� ��Ʈ�� Set �� ���ȭ ó���� : iterator() ���
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
	
	//����Ŭ���� : Inner(Nested) class
	//�ܺ�Ŭ������ ����� ��
	//���������ڳ� ���� �ʵ峪 �޼ҵ忡 ����� �Ͱ�
	//�����ϰ� ����� �� ����.
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











