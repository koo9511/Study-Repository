package test.chario;

import java.io.*;
import java.util.*;

public class FileIOSample {
	public FileIOSample() {}
	
	//키보드로 문자열 입력받아 바로 파일에 저장 처리용
	//문자열 입력 종료는 "exit" 입력시 종료 처리함
	public void fileSave() {
		//문자기반 파일 출력 스트림 클래스 : FileWriter
		Scanner sc = new Scanner(System.in);
		String message = null;
		
		System.out.print("저장할 파일명 : ");
		String fileName = sc.next();
		sc.nextLine();  //버퍼에 남은 엔터키 제거작업

		try(FileWriter fw = new FileWriter(fileName);){
			System.out.println("파일에 저장할 내용을 입력하세요.");
			while(!(message = sc.nextLine()).equals("exit")) {
				fw.write(message + "\n");
				fw.flush();
			}
			
			System.out.println(fileName + "에 성공적으로 저장 완료되었습니다.");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//저장된 파일로 부터 문자열 값을 읽어서 화면에 출력 처리
	public void fileOpen() {
		//문자기반 파일입력 스트림 클래스 : FileReader
		System.out.print("읽을 파일명 : ");
		String fileName = new Scanner(System.in).next();
		
		try(FileReader fr = new FileReader(fileName);){
			//읽을 대상파일이 존재하지 않으면 에러 발생함
			System.out.println(fileName + "에 저장된 내용은 다음과 같습니다.");
			
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















