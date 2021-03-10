import java.io.*;
import java.net.*;

public class URLPostTest {
	public static void main(String[] args) throws Exception {

		String s = URLEncoder.encode("This is a test", "UTF-8");

		URL url = new URL("http://igchun.sch.ac.kr/script/test");
		URLConnection connection = url.openConnection();
		connection.setDoOutput(true);

		OutputStreamWriter out = new OutputStreamWriter(connection
				.getOutputStream());
		out.write("string=" + s);
		out.close();

		BufferedReader in = new BufferedReader(new InputStreamReader(connection
				.getInputStream()));
		String inputLine;

		while ((inputLine = in.readLine()) != null)
			System.out.println(inputLine);

		in.close();
	}
}
