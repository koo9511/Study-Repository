package javastudy;

import java.util.Scanner;

public class test {
	
	static Scanner scan = new Scanner(System.in);
	
	public static int Example1() {
		
		System.out.print("이름 : ");
		String name = scan.next();
		
		System.out.print("나이 : ");
		int age = scan.nextInt();
		
		System.out.print("연락처 : ");
		String tel = scan.next();
		
		System.out.println("\n이름 : " + name + "\n나이 : " + age + "세" + "\n연락처 : " + tel);
		
		return age;
		
	}
	
	public static void Example2() {
		
		System.out.print("첫 번째 정수 : ");
		int first = scan.nextInt();
		
		System.out.print("두 번째 정수 : ");
		int second = scan.nextInt();
		
		System.out.println("더하기 결과 : " + (first + second));
		System.out.println("빼기 결과 : " + (first - second));
		System.out.println("곱하기 결과 : " + (first * second));
		System.out.println("나누기한 몫 : " + (first / second));
		System.out.println("나누기한 나머지 : " + (first % second));
	}
	
	public static void Example3() {
		
		System.out.print("가로 : ");
		double width = scan.nextDouble();
		System.out.print("세로 : ");
		double height = scan.nextDouble();
		
		System.out.println("면적 : " + (width * height));
		System.out.println("둘레 : " + (width + height));
	}
	
	public static void Example4() {
		
		System.out.print("문자열을 입력하세요 : " );
		String str = scan.next();
		
		System.out.println("첫 번째 문자 : " + str.charAt(0));
		System.out.println("두 번째 문자 : " + str.charAt(1));
		System.out.println("세 번째 문자 : " + str.charAt(2));
	}
	
	public static void Example5() {
		
		System.out.print("국어 : ");
		int korean = scan.nextInt();
		
		System.out.print("영어 : ");
		int english = scan.nextInt();
		
		System.out.print("수학 : ");
		int math = scan.nextInt();
		
		int sum = korean + english + math;
		int avg = sum/3;
		
		if(korean >= 40 && english >= 40 && math >= 40) {
			if(avg >= 60) {
				System.out.println("====== 합격 ======");
				System.out.println("국어 : " + korean + "점");
				System.out.println("영어 : " + english + "점");
				System.out.println("수학 : " + math + "점");
				System.out.println("총 합계 : " + sum + "점");
				System.out.println("평균 : " + avg + "점");
			} else {
				System.out.println("불합격");
			}
		} else {
			System.out.println("불합격");
		}
		
	}
	
	public static void Example6() {
		
		System.out.print("문자열 입력 : ");
		String str = scan.next();
		
		System.out.print("문자 입력 : ");
		char alpha = scan.next().charAt(0);
		
		int count = 0;
		
		for(int i=0; i<str.length(); i++) {
			if(str.charAt(i) == alpha) {
				count++;
			}
		}
		
		System.out.println("포함된 갯수 : " + count + "개");
		
	}
	
	public static void countInputCharacter() {
	      String input1 = scan.next();
	      char input2 = scan.next().charAt(0);
	      
	      int count = 0;
	      
	      for (int i=0; i<input1.length(); i++)
	      {
	         if (input2 == input1.charAt(i))
	         {
	            count++;
	         }
	      }
	      
	      System.out.println("포함된 갯수"+count+"개");
	   }

	public static void main(String[] args) {
		
//		System.out.println("1번 문제");
//		Example1();
//		
//		System.out.println("\n2번 문제");
//		Example2();
//		
//		System.out.println("\n3번 문제");
//		Example3();
//		
//		System.out.println("\n4번 문제");
//		Example4();
//		
//		System.out.println("\n5번 문제");
//		Example5();
		
//		Example6();
		
		countInputCharacter();
		
	}

}
