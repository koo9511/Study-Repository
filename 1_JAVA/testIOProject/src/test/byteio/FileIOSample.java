package test.byteio;

import java.io.*;

public class FileIOSample {
	public FileIOSample() {}
	
	//������ �ϳ� ����鼭, ���Ͽ� �� ��� ���� ó����
	public void fileSave() {
		String message = "���ڿ� ������ �޼���";
		int value = 123;
		
		//��� ��� ������ File ��ü�� ����
		File saveFile = new File("byteSample.dat");
		
		//������¿� Ŭ���� ���� : ��½�Ʈ���� �����
		//���� �����Ǵ� ���α׷��� ������ �����
		FileOutputStream fout = null;
		try {
			fout = new FileOutputStream(saveFile);
			//������½�Ʈ���� ��� ������ ������
			//�ڵ����� ������ ����鼭 ��ü ������
			
			//����� ��� ���Ͽ� �� ��� ó�� : ���Ͽ� ������
			fout.write(message.getBytes());
			fout.write(value);
			
			System.out.println(message.getBytes().length);
			
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}finally {
			try {
				fout.close();
			} catch (IOException e) {				
				e.printStackTrace();
			}
		}
		
	}
	
	//�����ϴ� ���Ϸ� ���� ���� �о ȭ�鿡 ��� ó����
	public void fileOpen() {
		//���Ͽ� ��ϵ� ������� �о����
		String message = null;
		int value = 0;
		FileInputStream fin = null;
		
		try {
			/*File readFile = new File("byteSample.dat");
			fin = new FileInputStream(readFile);*/
			fin = new FileInputStream("byteSample.dat");
			//�����б� ��Ʈ�� ������ ��� ������ ������
			//"FileNotFoundException" ���� �߻���
			byte[] br = new byte[20];
			fin.read(br);
			message = new String(br);
			
			value = fin.read();
			
			System.out.println("message : " + message);
			System.out.println("value : " + value);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}finally {
			try {
				fin.close();
			} catch (IOException e) {				
				e.printStackTrace();
			}
		}
	}	
}











