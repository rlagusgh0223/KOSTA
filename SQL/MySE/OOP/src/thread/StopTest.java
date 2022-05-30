package thread;

import java.util.Scanner;

class Stop extends Thread{
	int max;
	int cnt;
	Stop(){
		cnt = 0;
		max = 1000000;
	}
	public void run() {
		for(; cnt<max; cnt++) {
			System.out.println(cnt + "running");
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("stop");
	}
}

public class StopTest {
	public static void main(String[] args) {
		Stop st = new Stop();
		st.start();
		Scanner sc = new Scanner(System.in);
		st.max = sc.nextInt();    // 키보드로부터 숫자값을 입력받는다 - 숫자 누르고 엔터 누르면 종료됨
	}
}