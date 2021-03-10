import java.net.*;
import java.io.*;

public class URLReaderExample {
	public static void main(String[] args) throws Exception {
		try {
			URL java = new URL("http://java.sun.com/");
			BufferedReader in = new BufferedReader(new InputStreamReader(java
					.openStream()));
			String inLine;
			while ((inLine = in.readLine()) != null)
				System.out.println(inLine);
			in.close();
		} catch (MalformedURLException e) {
			System.out.println(e);
		}
	}
}
