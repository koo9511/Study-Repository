package test.byteio;

import java.io.*;

public class FileIOSample {
	public FileIOSample() {}
	
	//파일을 하나 만들면서, 파일에 값 기록 저장 처리용
	public void fileSave() {
		String message = "문자열 형태의 메세지";
		int value = 123;
		
		//출력 대상 파일을 File 객체로 생성
		File saveFile = new File("byteSample.dat");
		
		//파일출력용 클래스 생성 : 출력스트림이 연결됨
		//현재 구동되는 프로그램과 파일이 연결됨
		FileOutputStream fout = null;
		try {
			fout = new FileOutputStream(saveFile);
			//파일출력스트림은 대상 파일이 없으면
			//자동으로 파일을 만들면서 객체 생성함
			
			//연결된 대상 파일에 값 기록 처리 : 파일에 저장함
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
	
	//지정하는 파일로 부터 값을 읽어서 화면에 출력 처리용
	public void fileOpen() {
		//파일에 기록된 순서대로 읽어들임
		String message = null;
		int value = 0;
		FileInputStream fin = null;
		
		try {
			/*File readFile = new File("byteSample.dat");
			fin = new FileInputStream(readFile);*/
			fin = new FileInputStream("byteSample.dat");
			//파일읽기 스트림 생성시 대상 파일이 없으면
			//"FileNotFoundException" 예외 발생함
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











