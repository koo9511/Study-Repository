package practice2;

public class AscCategory implements java.util.Comparator{
	public AscCategory(){}
	
	@Override
	public int compare(Object o1, Object o2) {
		// 카테고리순 오름차순 정렬
		int result = 0;
		if(o1 instanceof Book && o2 instanceof Book){
			Book b1 = (Book)o1;
			Book b2 = (Book)o2;
			
			result = (b1.getCategory() > b2.getCategory())? 1 : 
				((b1.getCategory() == b2.getCategory())? 0 : -1);
		}
		
		return result;		
	}

}
