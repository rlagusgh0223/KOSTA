package inheritance;

class PP{
	int ppv;
	String sv;
}
class P extends PP{
	int pv;
}
class C extends P{
	int cv;
	int sv;    // 메모리가 확보되기는 한다. 그런데 변수 이름이 중복되므로 자기가 선언한 변수를 우선하여 출력시 int로 출력된다
	// 정확히 부모의 변수를 지칭하고 싶다면 메소드를 만들어야 한다(super.변수)
	void c() {
		System.out.println(super.sv);    // null
		System.out.println(super.pv);    // 0
	}
}

public class VariableDup {
	public static void main(String[] args) {
		C c = new C();
		System.out.println(c.sv);
	}
}