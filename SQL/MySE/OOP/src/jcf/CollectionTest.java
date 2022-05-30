package jcf;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Objects;

class A{
	int i;
	A(int i){
		this.i = i;
	}
	@Override
	public int hashCode() {
		return Objects.hash(i);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		A other = (A) obj;
		return i == other.i;    // return this.hashCode() == other.hashCode()도 같은 결과
	}
	@Override
	public String toString() {
		return "A [i=" + i + "]";
	}
	
}

public class CollectionTest {
	public static void test(Collection c) {
		c.add(new String("one"));    // add()의 매개변수타입은 Object이다. String이 Object로 업캐스팅
		c.add(new Integer(2));    // Integer가 Object로 업캐스팅
		c.add(3);    // AutoBoxing : 컴파일시에 c.add(new Integer(3));로 바뀜
		c.add(2);    // AutoBoxing 
		
		c.add(new A(5));    // 이 자체로는 5가 중복되지 않는걸로 판단하지만, A 클래스에
		c.add(new A(5));    // hash와 equals 오버라이딩 메소드를 추가하여 중복된다고 판단하게 했다
		
		System.out.println("자료수 : "+c.size());
		System.out.println(c+"\n");    // c.toString() 자동호출됨
	}
	public static void test(Map m) {
		m.put("one", "first");
		m.put(new Integer(2), "second");
		m.put(3, "third");
		m.put(2, "fourth");
		m.put(new A(5),  "fi");
		m.put(new A(5),  "si");
		System.out.println("자료수 : "+m.size());
		System.out.println(m+"\n");    // m.toString() 자동호출됨
	}
	public static void main(String[] args) {
		// List는 순차저장되며, 중복 데이터도 허용한다
//		List list = new ArrayList();    // List는 직접적으로 객체를 생성할 수 는 없지만 하위 객체인 ArrayList()를 하면 업캐스팅되서 객체 생성됨
//		test(list);
		// 위의 두 줄로 해도 되고, 아래의 한 줄로 해도 결과는 같다
		System.out.println("List");
		test(new ArrayList());
		
		// Set은 순차저장 안되고, 중복데이터 허용 안된다
		System.out.println("Set");
		test(new HashSet());
		
		// Map은 List나 Set과 달리 Collection의 하위 계층이 아니라 Collection으로 업캐스팅 불가능
		// Map과 Collection은 강제/자동형변환 불가
		System.out.println("Map");
		test(new HashMap());
	}
}
