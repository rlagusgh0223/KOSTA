package inheritance;

public class Child extends Parent{
	private String c1;
	public Child(){}
	public Child(String c1){
		super("자식에서 설정한 부모변수", 10000);    // 부모 생성자 중에 원하는걸 골라 쓸 수 있다
		this.c1 = c1;
	}
	public void cm() {
		System.out.println("자식의 기능입니다");
		System.out.println("c1 = "+c1);
		pm();
//		System.out.println("p1 = "+p1);    // 자식이라도 private변수에는 접근할 수 없다
		// 상속은 되는데 직접 접근은 못한다
	}
}