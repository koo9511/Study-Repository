package practice2;

import java.util.*;

public class TestBookManager {

	public static void main(String[] args) {
		// 컬렉션 실습문제 2
		BookManager bManager = new BookManager();
		Scanner sc = new Scanner(System.in);
		int no;
		
		do{
			System.out.println("\n*** 도서 관리 프로그램 ***\n");
			System.out.println("1. 새 도서 추가");
			System.out.println("2. 도서정보 정렬후 출력");
			System.out.println("3. 도서 삭제");
			System.out.println("4. 도서 검색출력");
			System.out.println("5. 전체 출력");
			System.out.println("6. 끝내기");
			System.out.print("번호 선택 : ");
			no = sc.nextInt();
			
			switch(no){
			case 1:	bManager.addBook(inputBook());	break;
			case 2:	bManager.printBookList(bManager.sortedBookList());	break;
			case 3:	bManager.deleteBook(bManager.searchBook(inputBookTitle()));	break;
			case 4:	bManager.printBook(bManager.searchBook(inputBookTitle()));	break;
			case 5:	bManager.displayAll();	break;
			case 6:	System.out.println("도서 관리 프로그램을 종료합니다...");
					System.exit(0);
			default:	System.out.println("잘못된 번호입니다. 다시 입력하십시오...");
			}
		}while(no != 6);

	}

	private static String inputBookTitle() {
		//삭제 또는 검색을 위한 도서 타이틀을 키보드로 입력받아 리턴
		System.out.print("도서 제목 : ");
		return new Scanner(System.in).nextLine();
	}

	public static Book inputBook() {
		//Book 객체의 필드값을 키보드로 입력받아 초기화하고 객체 리턴
		Scanner sc = new Scanner(System.in);
		
		System.out.print("도서번호 : ");
		String no = sc.next();
		System.out.print("도서분류코드(1.인문/2.자연과학/3.의료/4.기타) 번호 : ");
		int category = sc.nextInt();
		System.out.print("도서 제목 : ");
		sc.nextLine();
		String title = sc.nextLine();
		System.out.print("저자 : ");
		String author = sc.next();
		
		return new Book(no, category, title, author);
	}

}
