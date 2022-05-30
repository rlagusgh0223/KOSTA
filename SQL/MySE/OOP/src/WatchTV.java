public class WatchTV {    // TV.JAVA를 사용할 클래스
	public static void main(String[] args) {    // 실행 목적의 클래스는 main메서드를 써야된다
		TV tv;
		tv = new TV();
		     // 객체화 : 1. new : 힙 메모리할당  2. TV:클래스 타입으로 채워짐.  3. 멤버변수 자동 초기화
//		tv.power = true;
		tv.powerOn();	// 전원을켠다
		boolean power = tv.isPower();    // 전원이 켜진경우 true를 반환
		                                 // 꺼진경우 false를 반환
		if(power) {    //if(power == true)와 같은 의미
			System.out.println("전원이 켜졌습니다");
			tv.setChannel(7);    // 채널을 설정한다
			tv.volumeUp();    // 음량값을 1증가한다
			System.out.println("현재 채널은" + tv.getChannel()    // 7
			                   + "음량은" + tv.getVolume()    // 1
			                   +"입니다"); 
			

			tv.setChannel(-1); 		// 잘못된 채널입니다 출력
			System.out.println("현재 채널은" + tv.getChannel()    // 7
			                   + "음량은" + tv.getVolume()    // 1
			                   +"입니다"); 
		}else {
			System.out.println("전원이 꺼졌습니다");
		}
	}
}
