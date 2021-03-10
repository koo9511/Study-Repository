package test.objectio;

import java.io.*;
import java.util.*;

public class ObjectIOSample {
	public ObjectIOSample() {}
	
	//������ �ϳ� �����, ���Ͽ� Book ��ü ������ ��� ����
	public void bookFileSave() {
		Book book = new Book("�ڹٸ� ��ƶ�.", 27500);
		
		try(FileOutputStream fout = new FileOutputStream("books.dat");
			ObjectOutputStream objOut = new ObjectOutputStream(fout);){
			objOut.writeObject(book);
			objOut.flush();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("books.dat ���Ͽ� ���� �Ϸ�.");
	}
	
	//books.dat �� ��ϵ� ��ü ������ �о�ͼ�,
	//Book ��ü�� �����ϰ� ���� ��� Ȯ��
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
	
	//ArrayList �� ����� Book ��ü���� ���Ͽ� ��� ���� 
	//���ϸ� : bookList.dat
	public void booksFileSave() {
		ArrayList<Book> bookList = new ArrayList<Book>();
		bookList.add(new Book("�ڹٸ� ��ƶ�.", 27500));
		bookList.add(new Book("����Ŭ �ذ��", 38000));
		bookList.add(new Book("��ǥ��2.0", 40000));
		bookList.add(new Book("�ڹ� Servlet/JSP", 35000));
		bookList.add(new Book("Ajax ����", 29000));
		
		try(ObjectOutputStream objOut = new ObjectOutputStream(
				new FileOutputStream("bookList.dat"));){
			
			for(int i = 0; i < bookList.size(); i++) {
				objOut.writeObject(bookList.get(i));
				objOut.flush();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("bookList.dat ���Ͽ� ���� ����!");
	}
	
	//bookList.dat ���Ͽ� ��ϵ� ��ü �������� �о�ͼ�
	//�ϳ��� Book ��ü�� �����ϰ�, Book ��ü����
	//ArrayList �� ���� ó���� ���� ��� Ȯ��
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
			//���� �бⰡ ������ �߻���.
			//���� �бⰡ ������, bookList ���� ��� Ȯ�� ó��
			for(Book book : bookList) {
				System.out.println(book.toString());
			}
			
			System.out.println("bookList �� ��ϵ� ���� �б⸦ �Ϸ���.");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}











