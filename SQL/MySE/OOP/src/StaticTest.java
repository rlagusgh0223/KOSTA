class A{
	int iv;
	static int sv;
	void m() {
		System.out.println("non-static method입니다 iv = " +this.iv);
		System.out.println("sv = "+this.sv);
		System.out.println("A.sv = " + A.sv);
		sm(); // non-static 메소드에서 static메소드 호출하는거 가능
	}
	static void sm() {
		System.out.println("Static method입니다 sv = " + A.sv);
//		System.out.println("iv = " + this.iv);  // static메소드 내부에서는 this 사용 못함
		// static메소드 안에서는 this예약어 사용 불가. 즉, 인스턴스 변수나 인스턴스 메소드 사용 불가
	}
}

public class StaticTest {
	public static void main(String[] args) {
		A a1, a2;
		a1 = new A();
		a2 = new A();
		a1.iv++;
		a1.sv++;
		
		System.out.println(a2.iv);		// 0
		System.out.println(a2.sv);		// 1 <- static변수니까 객체와 무관하게 계산된다
		System.out.println(A.sv);
		
		a1.m();
		// A.m();으로는 사용할 수 없다
		
		a1.sm();
		A.sm();		// 클래스이름.static메소드 호출을 권장
		
	}
}
