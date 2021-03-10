package test.copy;

import test.list.Book;

public class TestCopy {

	public static void main(String[] args) {
		// 얕은 복사(Shallow Copy) : 주소 복사를 의미함
		Book b1 = new Book("자바를 잡아라.", 37500);
		Book b2 = b1;  //주소복사 : 얕은 복사
		//객체는 1개, 참조하는 레퍼런스는 2개
		
		System.out.println("b1 : " + b1);
		System.out.println("b2 : " + b2);
		System.out.println(b1.hashCode() + ", " + b2.hashCode());
		
		// 깊은 복사(Deep Copy) : 쌍동이 객체를 새로 생성함
		Book b3 = (Book)b1.clone();
		System.out.println("b3 : " + b3);
		System.out.println(b3.hashCode());

	}

}







