public class Employee {
	String no;    // 사번
	String name;    // 이름
	int salary;    // 급여
	Employee(){
		System.out.println("생성자가 호출됨!");
	}    // 생성자 - 객체 생성시 자동 호출되는 특수 메소드라 리턴값 없음
	Employee(String no, String name){
//		this.no = no;
//		this.name = name;
//		this.salary = 1000;
		//System.out.println("this생성자호출은 생성자의 처음위치에서만 가능하다");
		this(no, name, 1000);    // 위의 내용이 중복되니까 이렇게 한줄로 처리하면 빠르다
								 // 현재 객체의 다른 생성자를 호출하라
								 // 생성자의 첫줄에서만 사용 가능
	}
	Employee(String no, String name, int salary){
		this.no = no;
		this.name = name;
		this.salary = salary;
	}
	void Employee() {}    // 메소드 - 리턴타입 반드시 선언된다
}