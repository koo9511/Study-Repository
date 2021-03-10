package test.list;

public class BookPriceDescending implements java.util.Comparator {

	@Override
	public int compare(Object o1, Object o2) {
		// 객체가 가진 필드중에서 정렬기준에 대한 필드를 지정함
		int result = 0;
		
		if(o1 instanceof Book && o2 instanceof Book) {
			Book b1 = (Book)o1;
			Book b2 = (Book)o2;
			
			/*if(b1.getPrice() > b2.getPrice())
				result = 1;
			if(b1.getPrice() < b2.getPrice())
				result = -1;*/
			result = b1.getPrice() - b2.getPrice();
		}
		
		return -result;
	}

}
