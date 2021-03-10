package javastudy;

public class Computer {
	
	// 객체 만들 때 필요한 항목 3가지
	// 필드, 생성자, Getter/Setter
	
	// Object
	// 팔, 다리, 얼굴, 발 = 객체
	
	// 전역 변수(필드)
	String cpu; // i7
	String mouse;
	String keyboard;
	//
	
	// 기본 생성자
	public Computer() {}
	
	// 생성자
	public Computer(String cpu, String mouse, String keyboard) {
		super();
		this.cpu = cpu;
		this.mouse = mouse;
		this.keyboard = keyboard;
	}

	//getter, setter
	public String getCpu() {
		return cpu;
	}

	public void setCpu(String parameter_cpu) {
		this.cpu = parameter_cpu; // i7
	}

	public String getMouse() {
		return mouse;
	}

	public void setMouse(String mouse) {
		this.mouse = mouse;
	}

	public String getKeyboard() {
		return keyboard;
	}

	public void setKeyboard(String keyboard) {
		this.keyboard = keyboard;
	}

	@Override
	public String toString() {
		return "Computer [cpu=" + cpu + ", mouse=" + mouse + ", keyboard=" + keyboard + "]";
	}
	
	

}
