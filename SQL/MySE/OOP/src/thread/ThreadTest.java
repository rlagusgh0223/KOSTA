package thread;

import java.text.SimpleDateFormat;
import java.util.Date;

class First extends Thread{
	@Override
	public void run() {
		// 이 스레드가 할 일
		for (int i=1; i<=100; i++) {
			System.out.println(Thread.currentThread().getName()+" : i = "+i);
		}
	}
}

class Second implements Runnable{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    // 시간 출력에 대한 패턴 지정
	// 월 : M
	// 분 : m(대소문자 구분할것)
	@Override
	public void run() {
		for (int i=0; i< 10; i++) {
			Date dt = new Date();
//			System.out.println(dt);
			String formatStr = sdf.format(dt);
			System.out.println(Thread.currentThread().getName() + ":현재시간=" + formatStr);
			long millis = 1000L;
			try {
				Thread.sleep(millis);    // 1초간 실행 중지
			} catch (InterruptedException e) {
				e.printStackTrace();    // 예외종류, 예외내용, 예외발생위치 모두 출력
//				e.getMessage();    //  예외내용만 반환
			}
		}
	}
}

public class ThreadTest {
	public static void main(String[] args) {
		Thread ct = Thread.currentThread();    // 현재 실행중인 Thread 반환
		String ctName = ct.getName();    // 반환된 스레드 이름 저장
		System.out.println("현재 사용중인 스레드이름 : "+ctName);    // 메인 스레드
		
		First one = new First();
		First two = new First();
		Second second = new Second();
		Thread three = new Thread(second);
		Thread four = new Thread(second);
//		one.run();    // 메인 스레드
		one.start();    // start 스레드
		two.start();
		three.start();
		four.start();
		
		System.out.println("끝");    // 메인 스레드 - 얘는 언제 출력될지 모른다. CPU는 스레드를 왔다갔다 하면서 작업하니까
	}
}