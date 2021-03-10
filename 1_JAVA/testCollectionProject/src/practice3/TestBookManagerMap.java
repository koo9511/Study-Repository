package practice3;

import java.util.Scanner;

import practice2.Book;

public class TestBookManagerMap {

	public static void main(String[] args) {
		// �÷��� �ǽ����� 3
		BookManagerMap bMap = new BookManagerMap();
		Scanner sc = new Scanner(System.in);
		int no;

		do {
			System.out.println("\n*** ���� ���� ���α׷�(Map ����) ***\n");
			System.out.println("1. �� ���� �߰�");
			System.out.println("2. �������� ������ ���");
			System.out.println("3. ���� ����");
			System.out.println("4. ���� �˻����");
			System.out.println("5. ��ü ���");
			System.out.println("6. ������");
			System.out.print("��ȣ ���� : ");
			no = sc.nextInt();

			switch (no) {
			case 1:
				bMap.putBook(inputBook());
				break;
			case 2:
				bMap.printBookMap(bMap.sortedBookMap());
				break;
			case 3:
				bMap.removeBook(bMap.searchBook(inputBookTitle()));
				break;
			case 4:
				bMap.printBook(bMap.searchBook(inputBookTitle()));
				break;
			case 5:
				bMap.displayAll();
				break;
			case 6:
				System.out.println("���� ���� ���α׷��� �����մϴ�...");
				System.exit(0);
			default:
				System.out.println("�߸��� ��ȣ�Դϴ�. �ٽ� �Է��Ͻʽÿ�...");
			}
		} while (no != 6);

	}

	private static String inputBookTitle() {
		// ���� �Ǵ� �˻��� ���� ���� Ÿ��Ʋ�� Ű����� �Է¹޾� ����
		System.out.print("���� ���� : ");
		return new Scanner(System.in).nextLine();
	}

	private static Book inputBook() {
		// Book ��ü�� �ʵ尪�� Ű����� �Է¹޾� �ʱ�ȭ�ϰ� ��ü ����
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
