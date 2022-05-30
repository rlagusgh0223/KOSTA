public class StringEx {
	public static void main(String[] args) {
		String s1 = new String("가나다");
		String s2 = new String("가나다");
		String s3 = "가나다";
		String s4 = "가나다";
		System.out.println(s1 == s2);    // s1과 s2가 참조하는 메모리가 다르므로 false
		System.out.println(s1 == s3);
		System.out.println(s3 == s4);    // s3과 s4는 참조하는 메모리가 같으므로 true
		
		// 문자열 내용을 비교할땐 ==이 아니라 equals 쓸것
		System.out.println(s1.equals(s2));    // true
		System.out.println(s1.equals(s3));
		System.out.println(s3.equals(s4));
		
		System.out.println(s1+"라마");    // 가나다라마 - s1객체 내용이 바뀐건 아니다
		System.out.println(s1);    // 가나다
		s1.substring(1, 3);    // 부분문자열(1번부터 3-1번 인덱스까지)
		
		s1 += "라마";    // s1 = "가나다라마"
		char c = s1.charAt(0);    // 0번 인덱스의 문자 반환
		System.out.println(c);    // '가'
		
		int size = s1.length();
		System.out.println(size);    // 5(자바는 문자의 개수로 계산한다)
		
		// Palindrome문자열 : 앞으로 읽어도, 뒤로 읽어도 같은 문자열
		// ex) 가나다나가  ABBA
		
		// Palindrome문자열 구분
		// Palindrome 문자열 입니다 출력
		String palindrome = "가나다나가";
		size = palindrome.length()-1;
		int cnt = 0, result = 0;
		while (cnt < palindrome.length()/2) {
			if (palindrome.charAt(cnt) != palindrome.charAt(size)) {
				result = 1;
				break;
			}
			cnt++;
			size--;
		}
		if (result == 0) {
			System.out.println("Palindrome 문자열 입니다");
		}
		else {
			System.out.println("Palindrome 문자열이 아닙니다");
		}
		
		palindrome = "ABBA";
		// 선생님 코드
		int length = palindrome.length();
		int half = length / 2; // 이걸 for에 그대로 넣어주면 돌릴때마다 계산해서 안좋은 코드다
		int i = 0;
		for (int j = length-1; i < half; i++, j--) {
			if (palindrome.charAt(i) != palindrome.charAt(j)) {
				break;
			}
		}
		if (i == half) {
			System.out.println("Palindrome 문자열 입니다");
		}
		else {
			System.out.println("Palindrome 문자열이 아닙니다");
		}
		
		palindrome = "ABCD";    // Palindrome 문자열이 아닙니다 출력
		
		//String str = "https://n.news.naver.com/article/003/0011161447?cds=news_media_pc&type=editn";
		// 위에건 실습할때 쓴거고, 테스트할땐 선생님과 결과 맞추기 위해 url 받았다
		String str = "https://news.naver.com/main/clusterArticles.naver?id=c_202205031110_00000070&mode=LSD&mid=shm&sid1=105&oid=018&aid=0005206604";		

		
		String hostName;    //str의 host : n.news.naver.com
		String path;    // str의 path(host ~? 앞의 값) : article/003/0011161447
		String queryString;    // str의 queryString(? 뒤의 값) : cds=news_media_pc&type=editn
		
		String regex = "\\?";    // 정규표현식?는 문자열로 쓰려면 \\를 써야된다. ?는 직접쓸 수 없다 
		int limit = 2;
		String arr[] = str.split(regex, limit);    // ?를 기준으로 문자열을 자른다(앞에 문자열, 뒤에 문자열 총 2개)
		
		String hostNameNPath = arr[0];
		int beginIndex = hostNameNPath.indexOf(":")+3;    // 5 - 문자(:)에 해당하는 인덱스 반환
		int endIndex = hostNameNPath.indexOf("/", beginIndex);    // 24 - 해당 문자열에서 /의 인덱스를 찾아라, 시작은 5+3
		hostName = hostNameNPath.substring(beginIndex, endIndex);
		path = hostNameNPath.substring(endIndex+1);
				// 동일 방법 : hostNameNPath.substring(endIndex+1, hostNameNPath.length());
		System.out.println(hostName);
		System.out.println(path);
		
		queryString = arr[1];
		String queryStringArr[] = queryString.split("&");
		for(int index=0; index<queryStringArr.length; index++) {
			String q = queryStringArr[index];
			String qArr[] = q.split("=", 2);
			String qName = qArr[0];
			String qValue = qArr[1];
			System.out.println("쿼리스트링 이름은"+qName+", 값은"+qValue);
			//쿼리스트링 이름은id, 값은c_202205031110_00000070
            //쿼리스트링 이름은mode, 값은LSD
			//쿼리스트링 이름은sid1, 값은shm
			//쿼리스트링 이름은oid, 값은018
			//쿼리스트링 이름은aid, 값은0005206604

		}
	}
}
