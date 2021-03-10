package practice2;

import java.util.*;

public class TestBookManager {

	public static void main(String[] args) {
		// �÷��� �ǽ����� 2
		BookManager bManager = new BookManager();
		Scanner sc = new Scanner(System.in);
		int no;
		
		do{
			System.out.println("\n*** ���� ���� ���α׷� ***\n");
			System.out.println("1. �� ���� �߰�");
			System.out.println("2. �������� ������ ���");
			System.out.println("3. ���� ����");
			System.out.println("4. ���� �˻����");
			System.out.println("5. ��ü ���");
			System.out.println("6. ������");
			System.out.print("��ȣ ���� : ");
			no = sc.nextInt();
			
			switch(no){
			case 1:	bManager.addBook(inputBook());	break;
			case 2:	bManager.printBookList(bManager.sortedBookList());	break;
			case 3:	bManager.deleteBook(bManager.searchBook(inputBookTitle()));	break;
			case 4:	bManager.printBook(bManager.searchBook(inputBookTitle()));	break;
			case 5:	bManager.displayAll();	break;
			case 6:	System.out.println("���� ���� ���α׷��� �����մϴ�...");
					System.exit(0);
			default:	System.out.println("�߸��� ��ȣ�Դϴ�. �ٽ� �Է��Ͻʽÿ�...");
			}
		}while(no != 6);

	}

	private static String inputBookTitle() {
		//���� �Ǵ� �˻��� ���� ���� Ÿ��Ʋ�� Ű����� �Է¹޾� ����
		System.out.print("���� ���� : ");
		return new Scanner(System.in).nextLine();
	}

	public static Book inputBook() {
		//Book ��ü�� �ʵ尪�� Ű����� �Է¹޾� �ʱ�ȭ�ϰ� ��ü ����
		Scanner sc = new Scanner(System.in);
		
		System.out.print("������ȣ : ");
		String no = sc.next();
		System.out.print("�����з��ڵ�(1.�ι�/2.�ڿ�����/3.�Ƿ�/4.��Ÿ) ��ȣ : ");
		int category = sc.nextInt();
		System.out.print("���� ���� : ");
		sc.nextLine();
		String title = sc.nextLine();
		System.out.print("���� : ");
		String author = sc.next();
		
		return new Book(no, category, title, author);
	}

}
