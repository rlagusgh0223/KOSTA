/**
 * 클래스에 대한 사용설명서(TV 객체가 될 클래스입니다.)
 * @author 김현호
 * @version 1.0
 */
// TV클래스에는 메모리가 없다. TV를 사용하는 객체에서 각각의 값을 가진다
public class TV {
	// 전원(boolean), 채널(int), 음량(int)
	private boolean power;
	private int channel;
	private int volume;
	public void powerOn() {
		power = true;
	}
	
	public boolean isPower() {
		return this.power;    // 어차피 power가 true나 false니까 그대로 반환해주면 된다
	}    // 현재 사용중인 TV 객체의 power 값 리턴
	
	/**
	 * 채널을 설정한다
	 * @param channel 설정할 채널값
	 */
	public void setChannel(int channel) {
		if (channel < 0){
			System.out.println("잘못된 채널입니다");
			return;
		}
		this.channel = channel;
	}
	/**
	 * 음량을 1 증가시킨다
	 */
	public void volumeUp() {
		volume++;
	}
	/**
	 * 채널을 반환한다
	 * @return 채널값
	 */
	public int getChannel() {
		return channel;
	}
	/**
	 * 음량을 반환한다
	 * @return 음량값
	 */
	public int getVolume() {
		return volume;
	}
}

// > java -cp bin Watch
// 1. WatchTV.class 파일 찾기
// 2. WatchTV 클래스에 JVM에 코드
// 3. 바이트코드 검증
// 4. 0,1로 재해석
// 5. 클래스 영역에 기억시킴
// 6. static 변수 자동초기화됨
// 7. WatchTV의 main() 호출