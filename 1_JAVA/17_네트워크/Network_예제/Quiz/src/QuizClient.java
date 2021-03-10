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
			System.err.println("localhost��  ������ �� �����ϴ�.");
			System.exit(1);
		} catch (IOException e) {
			System.err.println("����� ����");
			System.exit(1);
		}

		BufferedReader user = new BufferedReader(new InputStreamReader(
				System.in));
		String fromServer;
		String fromUser;

		while ((fromServer = in.readLine()) != null) {
			System.out.println("����: " + fromServer);
			if (fromServer.equals("quit"))
				break;

			fromUser = user.readLine();
			if (fromUser != null) {
				System.out.println("Ŭ���̾�Ʈ: " + fromUser);
				out.println(fromUser);
			}
		}

		out.close();
		in.close();
		quizSocket.close();
	}
}
