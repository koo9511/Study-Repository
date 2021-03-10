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
		//��ü�� �Ȱ��� ��ü�� �����ؼ� ����
		//��������(Deep Copy) ��� ��
		return new Book(this.title, this.price);
	}
	
	@Override
	public boolean equals(Object obj) {
		//return this == obj;
		//�� ��ü�� ���� �ʵ尪���� �Ȱ����� �񱳰�� ����
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










