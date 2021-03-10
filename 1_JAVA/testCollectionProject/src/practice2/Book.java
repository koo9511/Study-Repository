package practice2;

public class Book implements java.io.Serializable{
	//Field
	private String bNo;	//������ȣ
	private int category;   //�����з��ڵ�(1.�ι�/2.�ڿ�����/3.�Ƿ�/4.��Ÿ)
	private String  title;	//å����
	private String  author;	//����
	
	public Book(){}

	public Book(String bNo, int category, String title, String author) {
		super();
		this.bNo = bNo;
		this.category = category;
		this.title = title;
		this.author = author;
	}

	public String getbNo() {
		return bNo;
	}

	public void setbNo(String bNo) {
		this.bNo = bNo;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Override
	public String toString(){
		return bNo + ", " + (category == 1? "�ι�":
							(category == 2? "�ڿ�����" : 
								(category == 3? "�Ƿ�" : "��Ÿ"))) 
				+ "�迭, " + title + ", " + author; 
	}
}
