package test.list;

//��ü ���Ľ� ������ ���� �ʵ� �����ϴ� ����
//�ݵ�� java.util.Comparator �������̽� ��ӹ޾ƾ� ��
public class BookTitleAscending 
				implements java.util.Comparator {

	@Override
	public int compare(Object o1, Object o2) {
		// ��ü�� ���� �ʵ��߿��� ���ı��ؿ� ���� �ʵ带 ������
		int result = 0;
		
		if(o1 instanceof Book && o2 instanceof Book) {
			Book b1 = (Book)o1;
			Book b2 = (Book)o2;
			
			result = b1.getTitle().compareTo(b2.getTitle());
		}
		
		return result;
	}

}












