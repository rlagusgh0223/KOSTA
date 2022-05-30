class Single{
	private static Single s = new Single();
	private Single() {}
	public static Single getInstance(){
		//return new Single();    // 이렇게 하면 매번 새 객체를 만들어서 리턴한다
		return s;
	}
}
public class Singleton {
	public static void main(String[] args) {
//		Single s1 = new Single();
		Single s1 = Single.getInstance();
		Single s2 = Single.getInstance();    // s1과 s2가 참조하는 객체가 같다
		System.out.println(s1 == s2);
	}
}