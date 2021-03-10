package javastudy.jeaha;

import java.util.Scanner;

public class rec_20210205
	{
	    public static void main(String[] args) 
	        {
//	            System.out.println("1.");
//	            example1();
	            
	            System.out.println("2.");
	            example2();
	}
	    
	    static Scanner scan = new Scanner(System.in);

	    public static void example1()
	        {
	            String str = scan.next();
	            char first = str.charAt(0);
	            char last = str.charAt(str.length() - 1); 
	            System.out.println("첫번째 문자 : " + first);
	            System.out.println("마지막 문자 : " + last);
	        }

	    public static void example2() 
	    {
	            int arr[] = new int[10];
	            int count = 0;
	            int sum = 0;
	            
	            for(int i = 0; i <5; i++) 
	            {
	            	arr[i] = scan.nextInt();
	                sum = arr[i] + sum;
	                if(arr[i] >= 60)
	               {
	                   count++; 
	               }
	            }

	            int average = sum/5;
	            
	            if(count >= 3 && average >= 80) 
            	{
                    System.out.println("합격");
            	}
	            else 
                {
                    System.out.println("불합격");
                }
        }
	    
	    // 모두80점일 때, 합격이 아닌 불합격이 출력됨
	}
