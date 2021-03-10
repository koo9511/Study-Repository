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
		//data ---> Object : Boxing (Wrapper Ŭ���� ���)
		
		System.out.println(hset/*.toString()*/);
		//���� ������ ���� �� ��
		
		hset.add(new Integer(120));
		//�ߺ� ���� ��� �� ��
		System.out.println(hset);
		
		//����� ��ü ����
		hset.remove(new Boolean(true));
		System.out.println(hset);
		
		//����� ��ü �� Ȯ��
		System.out.println("���� ����� ��ü�� : " + hset.size());
	
		//���� ���� ����
		hset.clear();
		System.out.println("������°�? " + hset.isEmpty());
		System.out.println("���� ����� ��ü�� : " + hset.size());
	}
	
	public void testHashSet2() {
		HashSet hset = new HashSet();
		
		hset.add("apple");
		hset.add(1250);  //autoBoxing : data --> Object �ڵ�ó����
		hset.add(0.75);
		hset.add('A');
		
		System.out.println(hset);
		
		//Set �� ����� ��ü�� �ϳ��� ��������
		//����� ��ü������ ��� ����� �� : iterator() ���
		//Iterator �������̽��� ��ü ����� �ǹ���
		Iterator iter = hset.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
	}
	
	public void testTreeSet() {
		//TreeSet : �ߺ� ���� �ȵ�. 
		//�ڵ� �������� ���� ����� ����Ǿ� ����
		//��, ���� ������ ��ü��θ� ����Ǿ��� �� ������.
		TreeSet tset = new TreeSet();
		
		tset.add("grape");
		tset.add("banana");
		tset.add("apple");
		tset.add("melon");
		tset.add("orange");
		
		System.out.println(tset);
		
		tset.add("apple");
		System.out.println(tset);
		
		//����� �̿��ؼ� �ϳ��� ������
		Iterator iter = tset.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
		
		//�����������ĵ� ����� ���� ���
		//Set descSet = tset.descendingSet();
		NavigableSet descSet = tset.descendingSet();
		System.out.println(descSet);
		
		//�����������ĵ� ����� ����ٸ�
		Iterator descIter = tset.descendingIterator();
		while(descIter.hasNext()) {
			System.out.println(descIter.next());
		}
		
	}
	
	public void testLinkedHashSet() {
		//LinkedHashSet : �ߺ� ���� �� ��.
		//��������� ������.
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









