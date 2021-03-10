package test.objectio;

//��ü�� ����¿� ����Ϸ��� �ݵ�� ����ȭ ó���ؾ� ��.
//Ŭ������ java.io.Serializable �������̽��� ��� ������ ��
//��ũ�� �������̽� : �߻�޼ҵ带 ������ ���� ���� �������̽�
//ǥ�ÿ� �������̽��� ����. ��� ��ü�� �ǹ̰� �ο���

//��ü������� �ڹٿ����� ObjectInputStream/ObjectOutputStream �� ������
//����Ʈ��Ʈ���� ������
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
