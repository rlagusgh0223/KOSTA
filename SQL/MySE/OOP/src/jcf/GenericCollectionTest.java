package jcf;

import java.util.ArrayList;
import java.util.List;

/**
 * Element Generic
 * @author Owner
 *
 */

public class GenericCollectionTest {
	public static void main(String[] args) {
		List list1;
		List<String> list2;    // 이렇게 선언하는걸 권장
		
		list1 = new ArrayList();
		list2 = new ArrayList<>();    // 이렇게 선언하는걸 권장
		
		// 의도와 다르게 컴파일해도 실행됨
		list1.add(new String("A"));
		list1.add(new Integer(1));
		list1.add(true);
		String s1 = (String)list1.get(0);    // 정상실행
		String s2 = (String)list1.get(1);    // ClassCastException발생, 프로그램 종료
		String s3 = (String)list1.get(2);
		
		// 의도와 다르게 컴파일하면 에러
		list2.add(new String("ABC"));
		list2.add("DEF");
//		list2.add(new Integer(1));    // 컴파일 오류 발생 String자료만 저장가능
		list2.add("GHIJ");
		list2.get(0);
		String s4 = list2.get(0);
		String s5 = list2.get(1);
		String s6 = list2.get(2);
	}
}
