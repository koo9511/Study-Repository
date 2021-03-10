import java.net.*;
import java.io.*;

public class URLConnectionReader {
	public static void main(String[] args) throws Exception {
		URL yahoo = new URL("http://www.naver.com/");
		URLConnection yc = yahoo.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc
				.getInputStream()));
		String inLine;

		while ((inLine = in.readLine()) != null)
			System.out.println(inLine);
		in.close();
	}
}
