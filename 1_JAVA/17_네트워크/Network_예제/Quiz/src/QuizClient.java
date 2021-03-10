import java.io.*;
import java.net.*;

public class QuizClient {
	public static void main(String[] args) throws IOException {

		Socket quizSocket = null;
		PrintWriter out = null;
		BufferedReader in = null;

		try {
			quizSocket = new Socket("localhost", 5555);
			out = new PrintWriter(quizSocket.getOutputStream(), true);
			in = new BufferedReader(new InputStreamReader(quizSocket
					.getInputStream()));
		} catch (UnknownHostException e) {
			System.err.println("localhost에  접근할 수 없습니다.");
			System.exit(1);
		} catch (IOException e) {
			System.err.println("입출력 오류");
			System.exit(1);
		}

		BufferedReader user = new BufferedReader(new InputStreamReader(
				System.in));
		String fromServer;
		String fromUser;

		while ((fromServer = in.readLine()) != null) {
			System.out.println("서버: " + fromServer);
			if (fromServer.equals("quit"))
				break;

			fromUser = user.readLine();
			if (fromUser != null) {
				System.out.println("클라이언트: " + fromUser);
				out.println(fromUser);
			}
		}

		out.close();
		in.close();
		quizSocket.close();
	}
}
