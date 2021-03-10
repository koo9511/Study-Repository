package test.list;

//객체 정렬시 정렬의 기준 필드 지정하는 역할
//반드시 java.util.Comparator 인터페이스 상속받아야 함
public class BookTitleAscending 
				implements java.util.Comparator {

	@Override
	public int compare(Object o1, Object o2) {
		// 객체가 가진 필드중에서 정렬기준에 대한 필드를 지정함
		int result = 0;
		
		if(o1 instanceof Book && o2 instanceof Book) {
			Book b1 = (Book)o1;
			Book b2 = (Book)o2;
			
			result = b1.getTitle().compareTo(b2.getTitle());
		}
		
		return result;
	}

}












