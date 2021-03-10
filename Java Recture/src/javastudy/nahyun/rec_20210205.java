package javastudy.nahyun;

import java.util.Scanner;

public class rec_20210205 {

		static Scanner scan = new Scanner(System.in);
		
		public static void example1(){
			String str = scan.next();
			char start = str.charAt(0);
			int length = str.length();
			char end = str.charAt(length - 1);	
			System.out.println("첫번째 문자 : " + start + "\n" + "마지막 문자 : " + end);
		}
		
		public static void example2() {
			int arr[] = new int[10];
			int cnt = 0;
			int sum = 0;
			
			for(int i = 0; i <5; i++) {
				arr[i] = scan.nextInt();
				if(arr[i] >= 60) {
					cnt++;
				}
				sum += arr[i];
			}
			
			int avg = sum/5;
			
			if(cnt >= 3 && avg >= 80) {
				System.out.println("합격");
			}
			else {
				System.out.println("불합격");
			}
			
		}
		
		public static void main(String[] args) {
//			System.out.println("숙제 1번 문제");
//			example1();
			System.out.println("\n숙제 2번 문제");
			example2();

		}

	}
