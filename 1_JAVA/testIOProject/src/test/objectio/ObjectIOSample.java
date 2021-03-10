package test.objectio;

import java.io.*;
import java.util.*;

public class ObjectIOSample {
	public ObjectIOSample() {}
	
	//파일을 하나 만들고, 파일에 Book 객체 정보를 기록 저장
	public void bookFileSave() {
		Book book = new Book("자바를 잡아라.", 27500);
		
		try(FileOutputStream fout = new FileOutputStream("books.dat");
			ObjectOutputStream objOut = new ObjectOutputStream(fout);){
			objOut.writeObject(book);
			objOut.flush();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("books.dat 파일에 저장 완료.");
	}
	
	//books.dat 에 기록된 객체 정보를 읽어와서,
	//Book 객체에 저장하고 나서 출력 확인
	public void bookFileOpen() {
		try(FileInputStream fin = new FileInputStream("books.dat");
			ObjectInputStream objIn = new ObjectInputStream(fin);){
			
			Book book = (Book)objIn.readObject();
			
			System.out.println(book);
			
		}catch(IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {			
			e.printStackTrace();
		}
	}
	
	//ArrayList 에 저장된 Book 객체들을 파일에 기록 저장 
	//파일명 : bookList.dat
	public void booksFileSave() {
		ArrayList<Book> bookList = new ArrayList<Book>();
		bookList.add(new Book("자바를 잡아라.", 27500));
		bookList.add(new Book("오라클 해결사", 38000));
		bookList.add(new Book("웹표준2.0", 40000));
		bookList.add(new Book("자바 Servlet/JSP", 35000));
		bookList.add(new Book("Ajax 사용법", 29000));
		
		try(ObjectOutputStream objOut = new ObjectOutputStream(
				new FileOutputStream("bookList.dat"));){
			
			for(int i = 0; i < bookList.size(); i++) {
				objOut.writeObject(bookList.get(i));
				objOut.flush();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("bookList.dat 파일에 저장 성공!");
	}
	
	//bookList.dat 파일에 기록된 객체 정보들을 읽어와서
	//하나씩 Book 객체에 저장하고, Book 객체들을
	//ArrayList 에 저장 처리한 다음 출력 확인
	public void booksFileOpen() {
		ArrayList<Book> bookList = new ArrayList<Book>();
		
		try(ObjectInputStream objIn = new ObjectInputStream(
				new FileInputStream("bookList.dat"));){
			while(true) {
				/*Book b = (Book)objIn.readObject();
				bookList.add(b);*/
				bookList.add((Book)objIn.readObject());
			}
			
			
		}catch(EOFException e) {
			//파일 읽기가 끝나면 발생함.
			//파일 읽기가 끝나면, bookList 정보 출력 확인 처리
			for(Book book : bookList) {
				System.out.println(book.toString());
			}
			
			System.out.println("bookList 에 기록된 정보 읽기를 완료함.");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}











