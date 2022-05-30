import java.util.Calendar;    // 이거 안쓰면 밑에서 일일히 쳐줘야 한다
import java.util.Map;
public class Function {
	public static void method5(Map map) {}
	public static void method4(int arr[]) {	}
	public static void method3() {
		System.out.println("파일이 만들어집니다");
	}
	// 함수는 함수명 앞에 함수의 반환 타입을 적어야 한다
 	public static String zodiac(int year) {    // 연도에 해당하는 동물값을 반환하는 함수
		//배열 초기화 
		String []zodiacSign; //선언
		//생성+대입
		zodiacSign = new String[] {"원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양" };
						
		int ganzi = year%zodiacSign.length;
		//System.out.println(zodiacSign[ganzi]);
		return zodiacSign[ganzi];
	}
	// 자료구조 맵, 배열을 전달할 함수
	public static void method1(int i) {    // 리턴할 값이 없는 함수는 void 선언
		System.out.println(i%2==0?"짝수":"홀수");    // 삼항연산자
	}
	public static String method2() {
		Calendar c = Calendar.getInstance();
		switch(c.get(Calendar.AM_PM)) {
		case Calendar.AM:
			return "오전";
		default:    // 리턴타입이 선언된 메소드는 반드시 값이 리턴되어야 한다.case PM과 결과는 같지만 컴퓨터는 그걸 모르므로 무조건 반환할 수 있는 형식으로 만들어줌
			return "오후";
		}
	}
	public static void main(String[] args) {
		method3();
		String ampm = method2();
		System.out.println(ampm);
		method1(5);
		
		java.util.Scanner sc = new java.util.Scanner(System.in);
		System.out.print("출생년도를 입력하세요 : ");
		int year = sc.nextInt();
		String result;
		result = zodiac(year);
		System.out.println(result);
	}
}