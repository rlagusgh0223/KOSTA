
public class CallbyTest {
	// 인자값을 매개변수에 전달방법
	// 1. CallByValue <- 자바에서는 이것만 쓴다.(변수나 인자값 복사-붙여넣기)
	// 2. CallByReference
	
	public static int m(int i) {    // 10이라는 값 자체를 받음
		// 만약 i를 byte타입으로 전하더라도 자동 형변환이 되서 여기서 받을 수 있다.
		// 그러나 float으로 보낼땐 자동 형변환이 되지 않으므로 받을 수 없다.
//		System.out.println(i);    // 10
		i = 99;    // 이 함수에서 i의 값을 99로 바꿈
		return i;
	}
	public static void m(int arr[]) {    // ex. main에서 1000번지 정보값을 받음
		arr[0] = 99;    // ex. 1000번지 정보값의 배열의 첫번째 값을 바꿈
	}
	public static void main(String[] args) {
		int i = 10;
		int j = m(i);   // int는 기본 자료형이니 10이라는 값 자체를 보내고 99로 받음
		System.out.println(i);    // 10
		System.out.println(j);    // 99

		// 자바는 참조형이고, 참조형 메모리는 HEAP 영역의 메모리를 갖는다.
		int arr[] = {10, 20, 30};
		m(arr);    // ex. 1000번지 정보값을 m에 보냄
		System.out.println(arr[0]);    // ex. 1000번지 정보값의 배열의 첫번째 값 99 출력
	}

}
