// 원래는 아래 class는 다른 파일에 만들어야 되지만 지금은 연습이고 그렇게 파일을 만들면
// 파일이 너무 많아지므로 그냥 위에 쓴다
class Rectangle{
	int row, col, area;
	
	/**
	 * 여기서 this(x,x)는 밑에 생성자 Rectangle(int row, int col)에 넣는다는 의미
	 * @param length
	 */
	Rectangle(int length){
		this(length, length);
	}
	/**
	 * 사각형의 가로, 세로 길이 입력하는 생성자
	 * @param row
	 * @param col
	 */
	Rectangle(int row, int col){
		this.row = row;
		this.col = col;
	}
	/**
	 * 가로길이와 세로길이 출력하는 메소드
	 */
	public void print() {
		System.out.println("가로길이는 "+this.row+", 세로길이는 "+this.col+"인 사각형입니다");
	}
	/**
	 * 사각형의 면적 계산하는 메소드
	 */
	public void calcArea() {
		area = row * col;
	}
	/**
	 * 사각형의 면적 리턴하는 메소드
	 * @return
	 */
	public int getArea() {
		return area;
	}
}

public class ShapeTest {
	public static void main(String[] args) {
		Rectangle r = new Rectangle(3, 4);    // 가로길이3, 세로길이4인 사각형객체
		r.calcArea();    // 사각형의 면적을 계산한다
		r.print();    // '가로길이는 3, 세로길이는 4인 사각형입니다' 출력
		int area = r.getArea();
		System.out.println("면적은 " + area + "입니다");
		
		Rectangle r1 = new Rectangle(5);    // 가로길이5, 세로길이 5인 사각형객체를 만든다
		r1.print();    // '가로길이는 5, 세로길이는 5인 사각형입니다'가 출력
	}
}
