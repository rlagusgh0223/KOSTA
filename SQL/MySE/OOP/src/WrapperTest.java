import java.util.Date;
/**
  기본형은 메서드가 없다
  int i = 34;
  i.toString(); (X)
  
  기본형과 참조형은 형변환불가
  String s = i; (X) 
  String s = (String)i; (X)
  
  기본형->String으로 바꿔주는 메서드를 활용
    String s = String.valueOf(i); i는 숫자 삼십사, s는 문자열 "34"
  String->기본형으로 바꿔주는 메서드를 활용
    int j = Integer.parseInt(s); s는 문자열 "34", j는 숫자 삼십사
  
  기본형->참조형으로 바꿔주는 방법
    Integer inte = new Integer(i);  
  참조형->기본형으로 바꿔주는 방법  
    int k = inte.intValue();
    
 * @author KOSTA
 *
 */
public class WrapperTest {
	public static void main(String[] args) {
		int i = 34;

		Integer inte = new Integer(i);
		inte.toString();
		System.out.println(Integer.MIN_VALUE);    // 기본형 int의 최소값
		System.out.println(Integer.MAX_VALUE);    // 최대값
		Object []arr = new Object[5];
		arr[0] = new String("문자열");
		arr[1] = new Date();
//		arr[2] = new Integer(1);    // 참조형 클래스를 object로 업캐스팅 가능
		// 기본형과 참조형은 형변환 불가 ex) arr[2] = i;는 안됨
		arr[2] = i;    // AutoBoxing : 컴파일러에 의해 arr[2] = new Integer(i);로 바뀜
//		arr[3] = new Character('A');
		arr[3] = 'A';    // AutoBoxing : new Character('A');

//		int j = arr[2];   // 참조형 -> 기본형 형변환 안됨
		int j = (Integer)arr[2];    // 컴파일러에 의해 Integer inte2 = (Integer)arr[2];
									// int j = inte2.intValue();로 바뀜
	}

}
