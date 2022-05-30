package inheritance;
/**
 * 자바 최상위 클래스는 java.lang.Object클래스이다
 * hashCode(), toString(), equals()
 * @author Owner
 *
 */

class A{  // class A extends Object{로 컴파일시 바뀐다
	int i;
	A(int i){
		this.i = i;
	}
	void print() {
		System.out.println("멤버변수 i값은 " + i + "입니다");
	}
	public String toString() {    // object의 toString()은 다른 결과를 내지만 여기서 재정의 해서 다른 결과가 나오게 했다
		return "멤버변수 i값은 " + i + "입니다";
	}
	
	/**
	 * 현재객체와 매개변수객체의 i값이 같으면 true, 그 외에는 false
	 */
	// 각 객체의 인스턴스 변수값이 같으면 true, 다르면 false 되도록 오버라이딩
	@Override  // 바로 밑의 메소드가 오버라이딩된 메소드라고 선언 - 컴파일러가 검사한다
	public boolean equals(Object obj) { // 오버라이딩하려면 부모와 자식의 메소드가 같아야 하기 때문에 이건 고치면 안된다
		if(obj instanceof A) {  // 매개변수 obj가 원래 A객체인가(업캐스팅으로 들어온 값인가?)
			A a = (A)obj;    // 다운캐스팅
			if(this.i==a.i) { //obj에는 i라는 인스턴스 변수가 없다 -> 다운캐스팅 해야 사용 가능
				return true;
			}
		}
		return false;  // 다운캐스팅할 수 없는 값이면 false
	}
}

public class ObjectTest {
	public static void toStringTest(Object o) {
		System.out.println(o.toString());
	}
	public static void equalsTest(Object obj1, Object obj2) {
		System.out.println(obj1.equals(obj2));
	}
	public static void main(String[] args) {
		A a1, a2;
		a1 = new A(3);    // i를 3으로 초기화
		a2 = new A(3);
		a1.print();    // 멤버변수 i값은 3입니다
		a2.print();    // 멤버변수 i값은 3입니다
		
		
		equalsTest(a1, a2);    // true 각 객체의 인스턴스 변수값이 같으면 true, 다르면 false
//		System.out.println(a1.toString());    // 멤버변수i값은 3입니다
//		System.out.println(a2.toString());    // 멤버변수i값은 3입니다
		toStringTest(a1);    // 멤버변수i값은 3입니다
		toStringTest(a2);
		
		Object o1, o2, o3;
		o1 = new Object();
		o2 = new Object();
		o3 = o1;
		// hashCode()
		System.out.println(o1.hashCode());
		System.out.println(o2.hashCode());
		System.out.println(o3.hashCode());

		equalsTest(o1, o2);    // false 각 객체가 같은 메모리면 true, 다른 메모리면 false
		equalsTest(o1, o3);    // true
		equalsTest(o1, a1);    // false 각 객체의 자료형이 같으면 true, 다르면 false
		equalsTest(a1, o1);    // o1은 A영역을 포함하고 있지 않으니까 다운캐스팅을 할 수 없다. 프로그램 죽어버림
		// toString()
//		System.out.println(o1.toString());
//		System.out.println(o2.toString());
//		System.out.println(o3.toString());
		toStringTest(o1);
		toStringTest(o2);
		toStringTest(o3);
		
		// equals()
		System.out.println(o1.equals(o2));    // false
		System.out.println(o1.equals(o3));    // true
		
		System.out.println("--equals overriding test--");
		equalsTest(a1, a2);
		equalsTest(o1, o2);
		equalsTest(o1, o3);
		equalsTest(o1, a1);
		equalsTest(a1, o1);
	}
}