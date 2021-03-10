package Final;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.util.ArrayList;

import javax.swing.ImageIcon;

public class Game extends Thread {
	private Image noteRouteLineImage = new ImageIcon(Main.class.getResource("../images/noteRouteLine.png"))
			.getImage();
	private Image judgementLineImage = new ImageIcon(Main.class.getResource("../images/judgementLine.png"))
			.getImage();
	private Image gameInfoImage = new ImageIcon(Main.class.getResource("../images/gameInfo.png"))
			.getImage();
	private Image noteRouteSImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteDImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteFImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteSpace1Image = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteSpace2Image = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteJImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteKImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteLImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	
	private Image FlareImage = new ImageIcon(Main.class.getResource("../images/Flare.png")).getImage(); 

	private String titleName;
	private String musicTitle;
	private Music gameMusic;
	
	ArrayList<Note> noteList = new ArrayList<Note>();
	
	public Game(String titleName, String musicTitle) {
		this.titleName = titleName;
		this.musicTitle = musicTitle;
		gameMusic = new Music(this.musicTitle, false);	
	}
	
	public void screenDraw(Graphics2D g) {
		g.drawImage(noteRouteSImage, 228, 30, null);
		g.drawImage(noteRouteDImage, 332, 30, null);
		g.drawImage(noteRouteFImage, 436, 30, null);
		g.drawImage(noteRouteSpace1Image, 540, 30, null);
		g.drawImage(noteRouteSpace2Image, 640, 30, null);
		g.drawImage(noteRouteJImage, 744, 30, null);
		g.drawImage(noteRouteKImage, 848, 30, null);
		g.drawImage(noteRouteLImage, 952, 30, null);
		g.drawImage(noteRouteLineImage, 224, 30, null);
		g.drawImage(noteRouteLineImage, 328, 30, null);
		g.drawImage(noteRouteLineImage, 432, 30, null);
		g.drawImage(noteRouteLineImage, 536, 30, null);
		g.drawImage(noteRouteLineImage, 740, 30, null);
		g.drawImage(noteRouteLineImage, 844, 30, null);
		g.drawImage(noteRouteLineImage, 948, 30, null);
		g.drawImage(noteRouteLineImage, 1052, 30, null);
		g.drawImage(gameInfoImage, 0, 660, null);
		g.drawImage(judgementLineImage, 0, 580, null);
		
		for(int i = 0; i < noteList.size(); i++)
		{
			Note note = noteList.get(i);
			if(!note.isProceeded()) {
				noteList.remove(i); // 지나가면 지우는
				i--;
			}
			else { note.screenDraw(g);
			}
		}
		g.setColor(Color.white);
		g.setRenderingHint( RenderingHints.KEY_TEXT_ANTIALIASING, 
				RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
		g.setColor(Color.WHITE);
		g.setFont(new Font("Arial", Font.BOLD, 30));
		g.drawString(titleName, 20, 702);
		g.setFont(new Font("Arial", Font.PLAIN, 26));
		g.setColor(Color.DARK_GRAY);
		g.drawString("S", 270, 609);
		g.drawString("D", 374, 609);
		g.drawString("F", 478, 609);
		g.drawString("Space Bar", 580, 609);
		g.drawString("J", 784, 609);
		g.drawString("K", 889, 609);
		g.drawString("L", 993, 609);
		g.setColor(Color.LIGHT_GRAY);
		g.setFont(new Font("Elephant", Font.BOLD, 30));
		g.drawImage(FlareImage, 320, 370, null);
	}
	
	public void pressS() {
		judge("S"); // judge는 Note 클래스에서 판정할 때 사용
		noteRouteSImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}
	
	public void releaseS() {
		noteRouteSImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	}
	
	public void pressD() {
		judge("D");
		noteRouteDImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}
	
	public void releaseD() {
		noteRouteDImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	}

	public void pressF() {
		judge("F");
		noteRouteFImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}
	
	public void releaseF() {
		noteRouteFImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	}

	public void pressSpace() {
		judge("Space");
		noteRouteSpace1Image = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		noteRouteSpace2Image = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		new Music("drumBig1.mp3", false).start();
	}
	
	public void releaseSpace() {
		noteRouteSpace1Image = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
		noteRouteSpace2Image = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	}
	
	public void pressJ() {
		judge("J");
		noteRouteJImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}
	
	public void releaseJ() {
		noteRouteJImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	}
	
	public void pressK() {
		judge("K");
		noteRouteKImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}
	
	public void releaseK() {
		noteRouteKImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	}
	
	public void pressL() {
		judge("L");
		noteRouteLImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}
	
	public void releaseL() {
		noteRouteLImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	}
	
	@Override
	public void run() {
		dropNotes();
	}
	
	public void close() {
		gameMusic.close();
		this.interrupt();
	}
	
	public void dropNotes() {
		Beat[] beats = null;
		if(titleName.equals("Park Hyo Shin - Happy Together")) {
			int startTime = 4460 - Main.REACH_TIME * 1000;
			int note = 170;
			beats = new Beat[] {
							
					//세상을 몰랐었던
							new Beat(startTime + note * 40, "S"),
							new Beat(startTime + note * 41, "D"),
							new Beat(startTime + note * 43, "J"),
							new Beat(startTime + note * 45, "K"),
							new Beat(startTime + note * 47, "L"),
							new Beat(startTime + note * 49, "S"),
							new Beat(startTime + note * 51, "D"),
					//마냥 웃기만 했던
							new Beat(startTime + note * 73, "K"),
							new Beat(startTime + note * 74, "L"),
							new Beat(startTime + note * 76, "J"),
							new Beat(startTime + note * 78, "S"),
							new Beat(startTime + note * 80, "D"),
							new Beat(startTime + note * 82, "J"),
							new Beat(startTime + note * 84, "Space"),
					//푸른 하늘 닮은 꿈을 가진
							new Beat(startTime + note * (102-2), "L"),
							new Beat(startTime + note * (103-2), "D"),
							new Beat(startTime + note * (104-2), "S"),
							new Beat(startTime + note * (106-2), "D"),
							new Beat(startTime + note * (107-2), "S"),
							new Beat(startTime + note * (110-2), "F"),
							new Beat(startTime + note * (112-2), "L"),
							new Beat(startTime + note * (114-2), "K"),
							new Beat(startTime + note * (116-2), "J"),
							new Beat(startTime + note * (118-2), "D"),
							new Beat(startTime + note * (120-1), "S"),
							new Beat(startTime + note * (121-1), "F"),
							new Beat(startTime + note * (122-1), "D"),
					//꼬마가 어느새
							new Beat(startTime + note * (125), "K"),
							new Beat(startTime + note * (127), "L"),
							new Beat(startTime + note * (129), "Space"),
							new Beat(startTime + note * (131), "S"),
							new Beat(startTime + note * (133), "F"),
							new Beat(startTime + note * (134), "D"),
					//담을 넘는다
							new Beat(startTime + note * 141, "S"),
							new Beat(startTime + note * 143, "F"),
							new Beat(startTime + note * 145, "K"),
							new Beat(startTime + note * 147, "J"),
							new Beat(startTime + note * 150, "L"),
							new Beat(startTime + note * 151, "S"),
					//으으음~
							new Beat(startTime + note * 161, "S"),
							new Beat(startTime + note * 162, "L"),
							new Beat(startTime + note * 163, "K"),
					//언덕 위로 좁게 트인	
							new Beat(startTime + note * 172, "S"),
							new Beat(startTime + note * 173, "L"),
							new Beat(startTime + note * 176, "K"),
							new Beat(startTime + note * 178, "J"),
							new Beat(startTime + note * 180, "L"),
							new Beat(startTime + note * 182, "S"),
							new Beat(startTime + note * 184, "D"),
							new Beat(startTime + note * 185, "F"),
					//그 작은 길 따라
							new Beat(startTime + note * 193, "S"),
							new Beat(startTime + note * 194, "K"),
							new Beat(startTime + note * 196, "L"),
							new Beat(startTime + note * 198, "S"),
							new Beat(startTime + note * 200, "K"),
							new Beat(startTime + note * 201, "S"),
					//어디로 가는 걸까
							new Beat(startTime + note * 206, "S"),
							new Beat(startTime + note * 207, "L"),
							new Beat(startTime + note * 209, "Space"),
							new Beat(startTime + note * 211, "S"),
							new Beat(startTime + note * 213, "L"),
							new Beat(startTime + note * 215, "K"),
							new Beat(startTime + note * 217, "S"),
					//작은  돌에 그만 넘어져도 (여기서 부터 그냥 정박)
							
			};
		}
		
		int i = 0;
		gameMusic.start();
		while(i<beats.length && !isInterrupted()) {
			boolean dropped = false;
			if(beats[i].getTime() <= gameMusic.getTime()) {
				Note note = new Note(beats[i].getNoteName());
				note.start();
				noteList.add(note);
				i++;
				dropped = true;
			}
			if(!dropped) {
				try {
					Thread.sleep(5);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	public void judge(String input) {
		for(int i=0; i<noteList.size(); i++) {
			Note note = noteList.get(i);
			if(input.equals(note.getNoteType())) {
				note.judge();
				break;
			}
		}
	}
}

