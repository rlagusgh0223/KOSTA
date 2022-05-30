package inheritance;

public class InheritanceTest {
	public static void main(String[] args) {
		Parent p = new Parent("부모변수", 1000);
		p.pm();
		
		Child c = new Child();
//		c.c1 = "자식변수";    // private로 선언된 이우헤는 쓸 수 없다
//		System.out.println(c.p1);
//		System.out.println(c.money);
		System.out.println("----");
		c.cm();
		System.out.println("----");
		c.pm();
		
		c = new Child("자식변수");    // Child 클래스의 매개변수가 있는 생성자 호출
		System.out.println("----");
		c.cm();
	}
}