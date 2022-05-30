package thread;
class Join extends Thread{
	int begin, end;
	int sum;
	Join(int begin, int end){
		this.begin = begin;
		this.end = end;
	}
	public void run() {
		for(int i=begin; i<=end; i++) {
			sum += i;
		}
	}
}
public class JoinTest {
	public static void main(String[] args) {
		Join j1 = new Join(1, 10);
		Join j2 = new Join(11, 20);
		j1.start();
		j2.start();
		try {
			j1.join();    // j1이 끝날때까지 main 스레드 동작 안함
			// join으로 main 스레드 잠재우지 않으면 결과 어떻게 될지 아무도 모른다
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		try {
			j2.join();    // j1, j2가 끝날때까지 main은 동작 안하니까 안전하게 두 스레드 종료할 수 있다
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println(j1.begin + "부터 " + j1.end + "의 합은 " + j1.sum);
		System.out.println(j2.begin + "부터 " + j2.end + "의 합은 " + j2.sum);
	}
}