package test.byteio;

public class TestMain {

	public static void main(String[] args) {
		// 바이트기반 스트림 클래스 사용 테스트
		// 파일 입출력 처리 테스트
		//FileIOSample fileio = new FileIOSample();
		FileIOSample2 fileio = new FileIOSample2();
		/*fileio.fileSave();
		System.out.println("파일에 저장 처리 완료됨.");*/
		fileio.fileOpen();
	}

}
