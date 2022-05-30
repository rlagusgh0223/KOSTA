
public class Array1 {

	public static void main(String[] args) {
		java.util.Scanner sc = new java.util.Scanner(System.in);
//		int score[];    // 배열 선언
//		score = new int[4];    // 배열 생성(4개의 방)
//		score[0] = 10;
//		score[1] = 8;
//		score[2] = 3;
//		score[3] = 5;
//		score = new int[7];
		
//		System.out.print("점수를 입력하세요");
//		score[0] = sc.nextInt();
//		System.out.print("점수를 입력하세요");
//		score[1] = sc.nextInt();
//		System.out.print("점수를 입력하세요");
//		score[2] = sc.nextInt();
//		System.out.print("점수를 입력하세요");
//		score[3] = sc.nextInt();
//		System.out.print("점수를 입력하세요");
//		score[4] = sc.nextInt();
//		System.out.print("점수를 입력하세요");
//		score[5] = sc.nextInt();
//		System.out.print("점수를 입력하세요");
//		score[6] = sc.nextInt();
		
		// 점수 입력을 반복문으로
//		for (int i=0;i<score.length;i++) {
//			System.out.print("점수를 입력하세요");
//			score[i] = sc.nextInt();
//		}
//		
//		int totalScore;		// 총점
		//totalScore = score[0] + score[1] + score[2] + score[3];
//		totalScore = 0;
//		for (int i=0;i<score.length;i++) {
		//for (int i=0;i<4;i++) {
//			totalScore += score[i];
//		}
//		System.out.println(totalScore);
//		System.out.println((float)totalScore/score.length);
		//System.out.println((float)totalScore/4);    // 평균값 실수로 출력
		// 위에서 보면 배열의 수는 여러번 사용되는데 나중에 수정을 안할 수 있으므로 length를 활용할 수 있다.

		
		
		// 12지 동물들
//		String zodiacSign[];		// 선언
//		zodiacSign = new String[12];		// 생성
//		zodiacSign[0] = "원숭이";			// 대입
//		zodiacSign[1] = "원숭이";
//		zodiacSign[2] = "원숭이";
//		zodiacSign[3] = "원숭이";
		
		// 위에 코드 처럼 선언, 생성, 대입을 따로 할 필요없이 한번에 입력할 수 있다.
		// 생성과 동시에 대입까지 이루어지는것 : 배열 초기화가 가능하다
		// 방법1 : 선언 + 생성 + 대입
		// String zodiacSign[] = {"원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양"};
		
		// 방법2
		String zodiacSign[];		// 선언
		// 생성 + 대입
		zodiacSign = new String[] {"원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양"};
		
		int year = 2022;
		int ganzi = year % zodiacSign.length;
		System.out.println(zodiacSign[ganzi]);
		
		// nums 배열의 값은 1~10 사이의숫자들이다.
		// 아래와 같이 숫자들의 출현횟수를 출력하시오
		// 1의 출현횟수 : 3회
		// 2의 출현횟수 : 1회
		// 3의 출현횟수 : 2회
		// 4의 출현횟수 : 0회
		// 5의 출현횟수 : 0회
		// 6의 출현횟수 : 1회
		// 7의 출현횟수 : 1회
		// 8의 출현횟수 : 0회
		// 9의 출현횟수 : 1회
		// 10의 출현횟수 : 1회
//		int nums[] = {1, 10, 3, 3, 1, 2, 7, 1, 6, 9};
//		int cnts[];    // 출현횟수 cnts[0]은 숫자 1의 출현횟수가 저장될 공간
//						// cnts[1]은 숫자 2의 출현횟수가 저장될 공간
//		cnts = new int[10];
//		for(int i=0; i<nums.length; i++) {
//			// cnts[nums의 값을 활용]++;
//			cnts[nums[i]-1]++;
//		}
//		for (int i=0; i<cnts.length; i++) {
//			System.out.println((i+1) + "의 출현횟수 : " + cnts[i] + "회");
//		}
		
		
		
		
		//nums1에서 배열의 최솟값을 찾아 출력하시오
		int nums1[] = {9, 3, 1, 4, 5};
		int min = nums1[0];    // 최솟값을 저장하는 변수에 nums1 배열의 첫번째 값 입력
		for (int i=1; i<nums1.length; i++) {    // nums1 배열의 2번째 값부터(첫번째값은 min변수에 있으니 이미 계산한것과 같다) 끝까지 min과 비교 
			if (min > nums1[i]) {    // 만약 min의 값이 현재 nums1의 값보다 크다면
				min = nums1[i];    // min에 nums1의 현재값 입력
			}
		}
		System.out.println(min);    // nums1의 가장 작은 값 출력

	}

}
