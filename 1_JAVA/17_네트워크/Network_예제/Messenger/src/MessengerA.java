import java.io.*;
import java.net.*;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class MessengerA {
	protected JTextField textField;
	protected JTextArea textArea;
	DatagramSocket socket;
	DatagramPacket packet;
	InetAddress address = null;
	final int myPort = 5000; // ���ſ� ��Ʈ ��ȣ
	final int otherPort = 6000; // �۽ſ� ��Ʈ ��ȣ

	public MessengerA() throws IOException {
		MyFrame f = new MyFrame();
		address = InetAddress.getByName("127.0.0.1");
		socket = new DatagramSocket(myPort);
	}

	// ��Ŷ�� �޾Ƽ� �ؽ�Ʈ ������ ǥ���Ѵ�.
	public void process() {
		while (true) {
			try {
				byte[] buf = new byte[256];
				packet = new DatagramPacket(buf, buf.length);
				socket.receive(packet); // ��Ŷ�� �޴´�.
				// ���� ��Ŷ�� �ؽ�Ʈ ������ ǥ���Ѵ�.
				textArea.append("RECIEVED: " + new String(buf) + "\n");
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
		}
	}

	// ���� Ŭ���� ����
	class MyFrame extends JFrame implements ActionListener {

		public MyFrame() {
			super("MessengerA");
			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

			textField = new JTextField(30);
			textField.addActionListener(this);

			textArea = new JTextArea(10, 30);
			textArea.setEditable(false);

			add(textField, BorderLayout.PAGE_END);
			add(textArea, BorderLayout.CENTER);
			pack();
			setVisible(true);
		}

		public void actionPerformed(ActionEvent evt) {
			String s = textField.getText();
			byte[] buffer = s.getBytes();
			DatagramPacket packet;

			// ��Ŷ�� �����Ѵ�.
			packet = new DatagramPacket(buffer, buffer.length, address,
					otherPort);
			try {
				socket.send(packet); // ��Ŷ�� ������.
			} catch (IOException e) {
				e.printStackTrace();
			}
			textArea.append("SENT: " + s + "\n");
			textField.selectAll();
			textArea.setCaretPosition(textArea.getDocument().getLength());
		}
	}

	public static void main(String[] args) throws IOException {
		MessengerA m = new MessengerA();
		m.process();
	}
}
