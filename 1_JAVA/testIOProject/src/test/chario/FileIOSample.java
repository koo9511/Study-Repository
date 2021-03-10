package test.chario;

import java.io.*;
import java.util.*;

public class FileIOSample {
	public FileIOSample() {}
	
	//Ű����� ���ڿ� �Է¹޾� �ٷ� ���Ͽ� ���� ó����
	//���ڿ� �Է� ����� "exit" �Է½� ���� ó����
	public void fileSave() {
		//���ڱ�� ���� ��� ��Ʈ�� Ŭ���� : FileWriter
		Scanner sc = new Scanner(System.in);
		String message = null;
		
		System.out.print("������ ���ϸ� : ");
		String fileName = sc.next();
		sc.nextLine();  //���ۿ� ���� ����Ű �����۾�

		try(FileWriter fw = new FileWriter(fileName);){
			System.out.println("���Ͽ� ������ ������ �Է��ϼ���.");
			while(!(message = sc.nextLine()).equals("exit")) {
				fw.write(message + "\n");
				fw.flush();
			}
			
			System.out.println(fileName + "�� ���������� ���� �Ϸ�Ǿ����ϴ�.");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//����� ���Ϸ� ���� ���ڿ� ���� �о ȭ�鿡 ��� ó��
	public void fileOpen() {
		//���ڱ�� �����Է� ��Ʈ�� Ŭ���� : FileReader
		System.out.print("���� ���ϸ� : ");
		String fileName = new Scanner(System.in).next();
		
		try(FileReader fr = new FileReader(fileName);){
			//���� ��������� �������� ������ ���� �߻���
			System.out.println(fileName + "�� ����� ������ ������ �����ϴ�.");
			
			int readData;
			StringBuilder sb = new StringBuilder();
			while((readData = fr.read()) != -1) {
				//System.out.print((char)readData);
				sb.append((char)readData);
			}
			System.out.println(sb.toString());
			System.out.println();
			
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
}















