package javastudy;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import oop.book.Book;

public class teacher_20210206 {
	
	public static void test() {
		
		Scanner scan = new Scanner(System.in);
		
		int arr[] = new int[5];
		int cnt = 0, sum = 0;
		
		System.out.println("국어, 영어, 수학, 사회, 과학 점수를 차레대로 입력하세요.");
		
		for(int i=0; i<=4; i++) {
			
			arr[i] = scan.nextInt();
			sum += arr[i];
			
			if(arr[i] >= 60) {
				cnt++;
			}
		}
		
		if(cnt < 3) {
			
			System.out.println("불합격");
			
		} else {
			
			double avg = sum/5;
			
			if(avg >= 80) {
				System.out.println("합격");
			} else {
				System.out.println("불합격");
			}
		}
		
		char op = 'a';
		
		int su2m = (int) (5*0.5);
		
		
		String flag = "";
		
		do {
//			. 계산식 
//			. 
//			. 
			
//          계속 하시겠습니까? (yes/no) : 
//			flag = scan.next();
			
		}while(flag.equals("yes"));
		
		int arr2[] = new int[0];
		
		
		
		List<Integer> list = new ArrayList<Integer>();
		
		
		list.add(50); // 삽입 
		list.get(0);  // 추출
		list.indexOf(50); // list 안에 30 이라는 값을 가지고 있으면, 해당 값의 Index 반환 = 0 // 없으면 -1
		list.set(0, 40); // 0번째 Index 값을 40으로 치환
		list.remove(0); // 0번째 Index 값 삭제
		
		
		
		// for-each
		// for(변수타입 변수명 : 배열이름){실행구문}
		// 배열의 값을 가져올 수 있지만, 값을 수정할 수는 없음
		for(Integer param : list) {
			
			System.out.println(param);
			// 30
			// 50
			// 100
			
		}
		
		Computer comp = new Computer(); // 기본 생성자
//		Computer comp2 = new Computer("cpu","mouse","keyboard"); // 생성자
		
		comp.getCpu(); // null
		
		comp.setCpu("i7");
		comp.getCpu(); // i7
		
		
		
		
		
		
	}
	
	public static void test5() {
		
//		Computer comp = new Computer(); // 기본 생성자
		
//		Computer comp2 = new Computer("cpu","mouse","keyboard"); // 생성자
		
//		comp.setCpu("i7");
//		comp.getCpu(); // i7
		
//		System.out.println(" --- 변경 전 --- ");
//		System.out.println("CPU : " + comp.getCpu());
//		System.out.println("MOUSE : " + comp.getMouse());
//		System.out.println("KEYBOARD : " + comp.getKeyboard());
//		
//		comp.setCpu("i7");
//		comp.setMouse("Logi");
//		comp.setKeyboard("RealForce");
		
//		System.out.println("\n --- 변경 후 --- ");
//		System.out.println("CPU : " + comp.getCpu());
//		System.out.println("MOUSE : " + comp.getMouse());
//		System.out.println("KEYBOARD : " + comp.getKeyboard());
		
		// 객체 2개
		
		
		
		
//		Computer comp2 = new Computer();
//		
//		comp2.setCpu("i9");
//		comp2.setMouse("재하");
//		comp2.setKeyboard("나현");
//		
//		System.out.println("comp CPU : " + comp.getCpu());
//		System.out.println("comp2 CPU : " + comp2.getCpu());
//		
//		System.out.println();
//		
//		System.out.println("comp MOUSE : " + comp.getMouse());
//		System.out.println("comp2 MOUSE : " + comp2.getMouse());
//		
//		System.out.println();
//		
//		System.out.println("comp KEYBOARD : " + comp.getKeyboard());
//		System.out.println("comp2 KEYBOARD : " + comp2.getKeyboard());
//		
//		
//		
//		List<String> stringList = new ArrayList<String>();
//		
////		Computer 객체 리스트 생성 어떻게 해요?
//		List<Computer> compList = new ArrayList<Computer>();
//		
//		compList.add(comp);
//		// cpu, mouse, keyboard
//		compList.add(comp2);
//		
//		// temp 는 comp 같은 값을 가지게 된다.
//		Computer temp = compList.get(0);
//		//
//		
//		System.out.println(compList.get(0).toString());
		
		
	}
	
	public static void objectTest() {
		
		Scanner scan = new Scanner(System.in);
		
		// 객체 선언
		Computer comp = new Computer();
		
		// 객체 요소 담기
		System.out.print("CPU를 입력해주세요 : ");
		comp.setCpu(scan.next());
		
		System.out.print("MOUSE를 입력해주세요 : ");
		comp.setMouse(scan.next());
		
		System.out.print("KEYBOARD를 입력해주세요 : ");
		comp.setKeyboard(scan.next());
		
		System.out.println(); // enter
		
		// 객체 요소 출력
		System.out.println("CPU는 " + comp.getCpu() + " 입니다.");
		System.out.println("MOUSE는 " + comp.getMouse() + " 입니다.");
		System.out.println("KEYBOARD는 " + comp.getKeyboard() + " 입니다.");
		
		scan.close();
		
	}
	
	public static void book_test() {
		
//		1.book
		Book book = new Book(); // 사라지지 않아 (할당된 메모리)
		Book book2 = new Book();
		Book book3 = new Book();
		// title, price, discountRate, author
		
		book.setAuthor("나현");
		book.setTitle("재하자서전");
		book.setPrice(3000);
		book.setDiscountRate(0.5);
		
		book2.setAuthor("재하");
		book2.setTitle("나현일기");
		book2.setPrice(5000);
		book2.setDiscountRate(0.5);
		
		book3.setAuthor("저자");
		book3.setTitle("제목");
		book3.setPrice(0);
		book3.setDiscountRate(0.0);
		
//		Book book2 = new Book();
		// String = ""
		// Integer = 
		// Chractor = ''
		// Double =
		
		String phone = "01025653871";
		
//		Object // 객체
		
		
		List<String> arr = new ArrayList<String>();
		
		// 객체 배열
		List<Book> bookList = new ArrayList<Book>(); // null : 값이 없다. = size = 0
		bookList.add(book); // size = 1
		bookList.add(book2); // size = 2
		bookList.add(book3); // size = 3
		
		
		
//		bookList.get(0); // 1. book
		
		
//		bookList ->  0,   1
//				   book, book2
//					|
//				title,price,discount,author
		
//		list.add(value)
//		list.add(value2)
		
		
		
//		[Book [title=재하 자서전, price=3000, discountRate=0.5, author=나현], // 0 
//		 Book [title=재하 자서전, price=3000, discountRate=0.5, author=나현], // 1
//		 Book [title=재하 자서전, price=3000, discountRate=0.5, author=나현]] // 2
		
		System.out.println("size : " + bookList.size());
		
//		1번 Index 의 값을 바꿔보쟈~
		System.out.println(bookList.get(1).toString());
		bookList.get(1).setTitle("나현");
		System.out.println(bookList.get(1).toString());
		System.out.println(bookList.toString());
		
//		[Book [title=나현, price=3000, discountRate=0.5, author=나현],
//		 Book [title=나현, price=3000, discountRate=0.5, author=나현], 
//		 Book [title=나현, price=3000, discountRate=0.5, author=나현]]
		
		
//		System.out.println(bookList.toString());
		
		
		
		
	}
	
	
	
	
	
	
	
	
	public static void test2() {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("원하는 과목을 입력하세요 : ");
		String name = scan.next();
		
		switch(name) {
			case "국어" : System.out.println("국어입니다."); break;
			case "영어" : System.out.println("영어입니다."); break;
			case "수학" : System.out.println("수학입니다."); break;
			default : System.out.println("잘못 입력되었습니다.");
		}
		
		System.out.print("식을 입력하세요 : "); // 5 x 5 
		int first = scan.nextInt();
		char operater = scan.next().charAt(0);
		int second = scan.nextInt();
		
		// 식을 입력하세요 : 5 x 5
		
		// 결과 : 25
		
		// 잘못된 식입니다.
		
		
		
		
		
		
	}

	public static void main(String[] args) {
		
		book_test();
	}

}
