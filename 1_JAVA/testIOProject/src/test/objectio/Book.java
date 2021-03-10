package test.objectio;

//객체를 입출력에 사용하려면 반드시 직렬화 처리해야 함.
//클래스에 java.io.Serializable 인터페이스를 상속 받으면 됨
//마크업 인터페이스 : 추상메소드를 가지고 있지 않은 인터페이스
//표시용 인터페이스를 말함. 사용 자체로 의미가 부여됨

//객체입출력은 자바에서는 ObjectInputStream/ObjectOutputStream 만 제공됨
//바이트스트림만 제공됨
public class Book implements java.io.Serializable {
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
	
}
