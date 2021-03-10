package javastudy;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;

public class Solution {
	
    static void start() {

    	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmss");
		
		Calendar cal = Calendar.getInstance();
		
		String today = formatter.format(cal.getTime());
		
		System.out.println(today);
    }
    
    public static void main(String[] args) {
		start();

	}

}

