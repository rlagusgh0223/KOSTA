package thread;

class Share{
	int i;
	Share(int i){
		this.i = i;
	}
	public void push() {
		synchronized(this) {
			notify();
			System.out.print("before push : i="+i);
			i++;
			System.out.println(", after push : i="+i);
		}
	}
	public void pop() {
		synchronized(this) {
			if(i==0) {
				try {
					wait();    // wait시킨 프로세스는 notify()를 써줘야 깨어난다
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			System.out.print("before pop : i="+i);
			i--;
			System.out.println(", after pop : i="+i);
		}
	}
}
class Push extends Thread{
	Share s;
	Push(Share s){
		this.s = s;
	}
	public void run() {
		for(int i=0; i<10; i++) {
			s.push();
		}
	}
}
class Pop extends Thread{
	Share s;
	public void run() {
		for(int i=0; i<10; i++) {
			s.pop();
		}
	}
}

public class ShareTest {
	public static void main(String[] args) {
		Share s = new Share(7);
		Push push = new Push(s);
		Pop pop = new Pop();
		pop.s = s;    // 이런 방법도 있다
		pop.start();
		push.start();
	}
}