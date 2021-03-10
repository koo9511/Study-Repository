package javastudy;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Scanner;

public class Exam1 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Please input the type of input you would like to print : ");
		
		String type = scan.next();
		scan.nextLine();
		
		System.out.println("Please give the input : ");
		
		switch(type) {
			case "int": int integer_value = scan.nextInt();
						System.out.println("The printed output is :" );
						if(integer_value >= 1000000) {
							NumberFormat numFormat = new DecimalFormat("0.00E0");
							System.out.println(numFormat.format(integer_value));
						}
						else {
							System.out.println(integer_value);
						}
						break;
						
			case "String": String string_value = scan.nextLine();
							
							if(string_value.length() > 16) {
						   		string_value = string_value.substring(0,15);
							}
							
						   
						   System.out.println("The printed output is :\n" + string_value);
						   break;
						   
			case "double": double double_value = scan.nextDouble();
						   if(double_value >= 1000000.0) {
							   NumberFormat numFormat = new DecimalFormat("0.##E0");
							   System.out.println(numFormat.format(double_value));
						   }
						   else {
							   System.out.println(double_value);
						   }
						   break;
			default : System.out.println("Your type of input is not valid.");
		}
		scan.close();
		
	}

}
