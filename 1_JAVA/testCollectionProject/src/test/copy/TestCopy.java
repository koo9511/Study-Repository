package test.copy;

import test.list.Book;

public class TestCopy {

	public static void main(String[] args) {
		// ���� ����(Shallow Copy) : �ּ� ���縦 �ǹ���
		Book b1 = new Book("�ڹٸ� ��ƶ�.", 37500);
		Book b2 = b1;  //�ּҺ��� : ���� ����
		//��ü�� 1��, �����ϴ� ���۷����� 2��
		
		System.out.println("b1 : " + b1);
		System.out.println("b2 : " + b2);
		System.out.println(b1.hashCode() + ", " + b2.hashCode());
		
		// ���� ����(Deep Copy) : �ֵ��� ��ü�� ���� ������
		Book b3 = (Book)b1.clone();
		System.out.println("b3 : " + b3);
		System.out.println(b3.hashCode());

	}

}







