package test.list;

public class Book {
	private String title;
	private int price;
	
	public Book() {}

	public Book(String title, int price) {
		super();
		this.title = title;
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Book [title=" + title + ", price=" + price + "]";
	}
	
	@Override
	public Object clone() {
		//객체와 똑같은 객체를 복제해서 리턴
		//깊은복사(Deep Copy) 라고 함
		return new Book(this.title, this.price);
	}
	
	@Override
	public boolean equals(Object obj) {
		//return this == obj;
		//두 객체가 가진 필드값들이 똑같은지 비교결과 리턴
		boolean result = false;
		Book other = null;
		
		if(obj instanceof Book)
			other = (Book)obj;  //down casting
		
		
		if(this.title.equals(other.title) == true 
				&& this.price == other.price) {
			result = true;
		}
			
		return result;
	}
}










