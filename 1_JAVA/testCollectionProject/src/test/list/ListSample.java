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
		
		//��ü�� ������
		//List �迭�� ����Ǵ� ������ ������.
		//����(index) �� �����
		alist.add(new String("grape"));
		alist.add("orange");  //auto Boxing
		alist.add(new Integer(12345));
		alist.add(753);  //�⺻�ڷ����� ���ؼ��� auto boxing ��.
		
		System.out.println(alist.toString());
		
		alist.add(new Book("�ڹٸ�����", 28000));
		
		System.out.println(alist);
		
		alist.add(2, "java");
		System.out.println(alist);
		
		System.out.println("����� ��ü�� : " + alist.size());
	
		//index �� �̿��ؼ� �ϳ��� ���� �� ����
		for(int i = 0; i < alist.size(); i++) {
			System.out.println(i + " : " + alist.get(i));
		}
		
		//������ �̿��ؼ� ���ϴ� ����� ������ ���� ����
		alist.set(2, new Date());
		System.out.println(alist);
		
		//����
		alist.remove(2);
		System.out.println(alist);
		alist.remove("grape");
		System.out.println(alist);
		
		//����Ʈ�� ��ü�迭�� �ٲٱ�
		Object[] objArray = alist.toArray();
		for(Object obj : objArray) {
			System.out.println(obj);
		}
		
		//����Ʈ�� ��� ���� ���� ó���� ���
		Iterator listIter = alist.iterator();
		while(listIter.hasNext()) {
			System.out.println(listIter.next());
		}
	}
	
	public void testSort() {
		//List �迭������ ��ü ���Ŀ� sort() �޼ҵ� ����� �� ����.
		ArrayList bookList = new ArrayList();
		
		bookList.add(new Book("�ڹ��� ����", 30000));
		bookList.add(new Book("����Ŭ", 45000));
		bookList.add(new Book("������ ������!", 20000));
		
		System.out.println(bookList);
		
		System.out.println("�������� ���� ������������ ��� Ȯ��");
		bookList.sort(new BookTitleAscending());
		System.out.println(bookList);
		
		System.out.println("�������� ���� ������������ ��� Ȯ��");
		bookList.sort(new BookPriceDescending());
		System.out.println(bookList);
	}
}













