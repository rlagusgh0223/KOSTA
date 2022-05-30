public class Struct {
	public static void main(String[] args) {
		// 배열 : 동일 자료형의 데이터 묶음, 크기 고정, 길이얻기 length
		int arr[] = new int[10];
		arr[0] = 5;
		arr[1] = 8;
//		arr[2] = "HELLO";    // 에러발생
//		arr[10] = 999;    // 10번 인덱스는 없다

		
		// 맵 : 키와 값을 저장할 수 있고, 크기가 자동 변경될 수 있다. 길이얻기size()
		java.util.Map map;
		map = new java.util.HashMap();
		map.put("name", "김현호");    // put(키, 값) : 자료 입력
		map.put("addr", "파주시");
		map.put("sal", 3000);
		System.out.println(map.size());
		System.out.println(map.get("name"));    // get(키) : 자료 얻기
		System.out.println(map.get("sal"));
	}
}
