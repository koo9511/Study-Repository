package practice3;

import practice2.Book;

public class AscBookTitle implements java.util.Comparator{
	public AscBookTitle(){}
	
	@Override
	public int compare(Object o1, Object o2) {
		//도서명 기준 오름차순 정렬 처리
		int result = 0;
		
		if(o1 instanceof Book && o2 instanceof Book){
			Book b1 = (Book)o1;
			Book b2 = (Book)o2;
			
			result = b1.getTitle().compareTo(b2.getTitle()) > 0 ? 1 : 
				(b1.getTitle().compareTo(b2.getTitle()) < 0 ? -1 : 0);
		}
		return result;
	}

}
