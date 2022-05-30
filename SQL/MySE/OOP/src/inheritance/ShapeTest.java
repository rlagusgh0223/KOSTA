package inheritance;

abstract class Shape{    // 메소드가 추상이면 클래스도 추상
	protected double area;
	double getArea() {
		return area;
	}
	void print() {
		System.out.println("이것은 도형입니다");
	}
	abstract void calcArea();    // 어떤 도형의 면적을 구하는건지 아직은 모르기 때문에 재정의 필요
}

class Circle extends Shape{
	private int radius;
	Circle(int radius){
		this.radius = radius;
	}
	void print() {
		super.print();    // 만약 오버라이딩하지 않고 부모 영역의 메소드 사용하고 싶으면 super.메소드명 쓴다
		System.out.println("반지름이"+radius+"인 원입니다");
	}
	void calcArea() {
//		area = 3.14 * radius * radius;
		area = this.radius * this.radius * Math.PI;    // Math.PI는 파이의 상수값
	}
}

class Rectangle extends Shape{
	private int width, height; 
	Rectangle(int width){
		this.width = width;
		this.height = width;
	}
	Rectangle(int width, int height){
		this.width = width;
		this.height = height;
	}
	void print() {
		super.print();
		System.out.println("가로"+width+", 세로"+height+"인 사각형입니다");
	}
	void calcArea() {
		area = width * height;
	}
}

class Triangle extends Shape{
	int width;    // 밑변
	int height;    // 높이
	Triangle(int width, int height){
		this.width = width;
		this.height = height;
	}
	void calcArea() {
		area = 0.5 * width * height;
		// area = width * height / 2.0;
	}
}

public class ShapeTest {
//	public static void printArea(Circle c) {    // 메소드 오버로드
//		System.out.println(c.getArea());    // 면적값 반환
//		System.out.println("----");
//	}
//	public static void printArea(Rectangle r) {
//		System.out.println(r.getArea());    // 면적값 반환하여 출력
//		System.out.println("----");
//	}
	public static void printArea(Shape s) {// 업캐스팅 - Circle이나 Rectangle영역의 주소(자식객체주소)를 받지만 그 안에서 Shape영역(부모객체영역)밖에 보지 못한다
		s.print();    // 오버라이딩 - Shape영역만 들어가는게 기본이지만 print()메소드가 Circle이나 Rectangle의 print()에 가려졌으므로 Circle이나 Rectangle의 값 출력
		System.out.println(s.getArea());
	}
	public static void main(String[] args) {
		Shape arr[] = new Shape[4];
		arr[0] = new Circle(5);    // 반지름이 5인 원 객체 생성해서 0번째 배열에 저장
		// 부모객체에 자식 객체 넣으면 업캐스팅됨
		arr[1] = new Rectangle(3,4);
		arr[2] = new Rectangle(5);
		arr[3] = new Triangle(5, 3);
		
		for(int i=0;i<arr.length;i++) {
			arr[i].calcArea();
//			arr[i].print();    // 어떨때는 Circle의 print()를, 어떤때는 Rectangle의 print() 선언 - 다형성 / 다양한 객체의 메소드가 호출될 수 있다
			printArea(arr[i]);    
			// Shape에는 print()메소드가 없어 에러가 뜸. Shape에 매개변수없는 생성자 만들것
			// 부모와 자식이 같으면 자식 메소드가 우선되므로 print()는 자식의 값 받는다
		}
//		Circle c = new Circle(5);    // 반지름이 5인 원객체생성
//		c.print();    // 반지름이 5인 원입니다 출력
//		c.calcArea();    // 원 면적 계산
//		printArea(c);
//		
//		Rectangle r = new Rectangle(3,4);    // 가로3, 세로 4인 사각형 객체 생성
//		r.print();    // 가로3, 세로4인 사각형입니다 출력
//		r.calcArea();    // 사각형 면적 계산
//		printArea(r);
//		
//		Rectangle r1 = new Rectangle(5);    // 가로5, 세로5인 사각형 객체 생성
//		r1.print();    // 가로5, 세로5인 사각형입니다
//		r1.calcArea();
//		printArea(r);
	}
}