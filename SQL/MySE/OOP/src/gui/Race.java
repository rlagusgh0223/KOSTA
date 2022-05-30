package gui;

import java.awt.Canvas;
import java.awt.Container;
import java.awt.Graphics;
import java.awt.GridLayout;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;
/**
 * 이벤트 프로그램 절차
 * 1. EventSource(이벤트가 발생될 곳)을 결정 ex) btReady
 * 2. 이벤트 종류를 결정 ex) ActionEvent
 * 3. EventHandler(이벤트가 발생했을때 할 일)을 작성
 *    ex) class MyHandler implements ActionListener{
 *          public void actionPerformed(ActionEvent e){
 *            sysout("준비되었습니다");
 *          }
 *        }
 * 4. EventSource와 EventHandler를 연결
 *    ex) btReady.add~~~(new MyHandler());
 * @author Owner
 *
 */
// 이름 없는 클래스로 사용할 수 도 있다
//class MyHandler implements ActionListener{
//	public void actionPerformed(ActionEvent e){
//		System.out.println("준비되었습니다");
//	}
//}

//class MyRunHandler implements ActionListener{
//	private JTextField jtf;
//	public MyRunHandler(JTextField jtf) {
//		this.jtf = jtf;
//	}
//	public void actionPerformed(ActionEvent e) {
//		jtf.setText("달립니다");
//	}
//}

// 말 3마리가 달리기 경주
class Horse extends Canvas implements Runnable{
	String name;
	int x = 10, y = 10;
	Horse(String name){
		this.name = name;
	}
	@Override
	public void paint(Graphics g) {
		g.drawString(name, x, y);
	}
//	@Override
//	public void update(Graphics g) {    // update()는 repaint()하면 돌아간다
//		for (int step=0; step<20; step++) {
//			x += 20;
//			super.update(g);;    // 화면 clear -> paint()자동 호출
//			long millis = (long)(Math.random() * 1000);    // 0 <= r < 1000
//			try {    // try-catch는 아래 코드 입력하면 빨간색으로 작성하라고 나오는거 쓴다
//				Thread.sleep(millis);
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}
//		}
//	}
	@Override
	public void run() {    // 말들이 경쟁하며 달리게 하기 위해
//		this.repaint();    // 이렇게만 하면 말 하나(스레드)가 동작이 끝나야 다음 말(스레드)이 동작한다
		// update()에 있는 반복문을 여기에 넣고 rapaint()를 반복문 안의 try에 선언하면
		// 번갈아가면서 이동하는걸 볼 수 있다
		// 그렇게 되면 update()메소드를 없애도 된다
		for (int step=0; step<20; step++) {
			x += 20;
			this.repaint();
			long millis = (long)(Math.random() * 1000);    // 0 <= r < 1000
			try {    // try-catch는 아래 코드 입력하면 빨간색으로 작성하라고 나오는거 쓴다
				Thread.sleep(millis);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
public class Race {
	private JFrame jf;    // 창 만들 변수
	private JButton btStart, btReady;    // 버튼 만들 변수
	private JTextField jtf;    // 한줄 입력란
	private Horse[] horses;
	class MyRunHandler implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			jtf.setText("달립니다");
			
			// run을 쓰지 않을때 사용
//			horses[0].repaint();    // repaint는 반복문을 써도 효과 없다
//			horses[1].repaint();    // 반복효과를 보려면 여기가 아니라 메소드에서 반복해야된다
//			horses[2].repaint();
			
			// 스레드 시작
			// run에 repaint 선언하면 이 코드 사용
			for(int i=0; i<horses.length; i++) {
				new Thread(horses[i]).start();
			}
		}
	}
	
	public Race() {
		jf = new JFrame("달리기");    // 창의 맨 위에 설명글
		btStart = new JButton("달려");
		btReady = new JButton("준비");
		jtf = new JTextField(10);    // 숫자 ()에 안 넣으면 입력란 매우 작아진다
		horses = new Horse[3];
		String horseNames[] = {"태풍", "화랑", "번개"};
		for(int i=0; i<horses.length; i++) {
//			horses[i] = new Horse("말" + (i+1));
			horses[i] = new Horse(horseNames[i]);
			
		}
		
		Container c = jf.getContentPane();    // 액자 뒷판(여기에 창에 올릴 버튼 올림)
//		c.setLayout(new FlowLayout());    // 판에서 배치할 위치 지정(이거 없으면 판 전체에 하나만 올라간다)
//			// FlowLayout() : 순서대로 정중앙에서 나타남
//		c.add(btReady);
//		c.add(btStart);
//		c.add(jtf);
		c.setLayout(new GridLayout(5, 1));
		c.add(horses[0]);    // c에 말 3마리가 올라감
		c.add(horses[1]);
		c.add(horses[2]);
		
		Panel panel = new Panel();
		panel.add(btReady);
		panel.add(btStart);
		c.add(panel);
		c.add(jtf);
		
//		MyHandler myHandler = new MyHandler();
//		btReady.addActionListener(myHandler);    // btReady 버튼을 누르면 MyHandler 클래스 실행
		
		// 위의 내용 클래스 이름(myHandler) 없이 동작시킬 수 있다
//		btReady.addActionListener(
//				new ActionListener() {
//					public void actionPerformed(ActionEvent e) {
//						// System.out.println("준비되었습니다");
//						jtf.setText("준비되었습니다");// 준비 버튼 누르면 창의 텍스트창에 문구 뜬다
//						for(Horse h: horses) {    // 준비 버튼 누르면 말들의 위치 초기화
//							h.x = 0;
//							h.repaint();
//						}
//					}
//				}
//		);
		// 위의 식을 람다식으로 표현 (매개변수) -> {할일}
		btReady.addActionListener((ActionEvent e) -> {
			jtf.setText("준비되었습니다");// 준비 버튼 누르면 창의 텍스트창에 문구 뜬다
			for(Horse h: horses) {    // 준비 버튼 누르면 말들의 위치 초기화
				h.x = 0;
				h.repaint();
			}
		});
		// 인터페이스는 객체 생성 용도가 아니기 때문에 바로 만들지는 못한다. 반드시 하위 클래스 만들어서 구현할것
//		btReady.addActionListener(new ActionListener());
//		btStart.addActionListener(
//				new ActionListener() {
//					public void actionPerformed(ActionEvent e) {
//						// System.out.println("달립니다");
//						jtf.setText("달립니다");
//					}
//				}
//		);
		// 위와 똑같은 일을 할 이벤트 핸들러 생성
		btStart.addActionListener(
				new MyRunHandler()
				//new MyRunHandler(jtf)
		);
		
		jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);    // x버튼 누르면 스레드 종료
		
		jf.setSize(500, 300);    // 창의 가로, 세로 길이
		jf.setVisible(true);    // 화면에 띄우기
	}
	public static void main(String[] args) {
		new Race();
	}
}