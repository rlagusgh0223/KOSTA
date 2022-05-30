public class Loop {
	public static void main(String[] args) {
		int score1 = 10;
		int score2 = 20;
		int score3 = 30;
		int score4 = 10;
		int totalScore = score1+score2+score3+score4;
		//System.out.println(totalScore);
		
		int num;
//		num=1;
//		System.out.println(num);
//		num=2;
//		System.out.println(num);
//		num=3;
//		System.out.println(num);
//		num=4;
//		System.out.println(num);
//		num=5;
//		System.out.println(num);
		
//		num = 0;
//		while(num < 5) {
//			num ++;
//			System.out.println(num);
//		}
		
//		num=1;
//		while(num<6) {
//			System.out.println(num);
//			num++;
//		}

		int sum = 0;    // 합
//		num = 1;
//		sum += num;
//		num = 2;
//		sum += num;
//		num = 3;
//		sum += num;
//		num = 4;
//		sum += num;
//		num = 5;
//		sum += num;

//		num = 0;
//		while (num < 100) {
//			num ++;
//			sum += num;
//		}
		
//		System.out.println(sum);
		
		
//		num = 1;
//		System.out.println(num);
//		num = 3;
//		System.out.println(num);
//		num = 5;
//		System.out.println(num);
//		num = 7;
//		System.out.println(num);
		
		// 숫자 1부터 총 4개의 홀수 출력
//		int count = 0;
//		num = 1;
//		while(count<4) {
//			System.out.println(num);
//			num += 2;
//			count++;
//		}
		
		// 피보나치 수열 : 1, 1, 2, 3, 5, 8, 13....(앞의 두 수를 더한게 지금값)
		int bb = 1;    // 이전이전수
		int b = 0;    // 이전수
		int current = bb + b;
		//System.out.println(current);

		bb = b;    // 이전수를 이전이전수에 대입 bb=0
		b = current;    // 현재수를 이전수에 대입 b=1
		current = bb+b;    // 현재수 1
		//System.out.println(current);

		bb = b;    // 이전수를 이전이전수에 대입 bb=1
		b = current;    // 현재수를 이전수에 대입 b=1
		current = bb+b;    // 현재수 2
		//System.out.println(current);
		
		
		// for문 이용해서 피보나치 수열이 9개 출력되게 할것
//		bb = 1;
//		b = 0;
		// for(int bb=1, b=0, i=0;i<9;i++)로 해도 된다
//		for (int i=0;i<9;i++) {
//			current = bb + b;
//			System.out.println(current);
//			bb = b;
//			b = current;
//		}
		
		// while문으로 해보기
//		bb = 1;
//		b = 0;
//		int i = 0;
//		while(i<9) {
//			current = bb + b;
//			System.out.println(current);
//			bb = b;
//			b = current;
//			i++;
//		}
		
		
		//0~44의 숫자 구하기
//		int rand = (int)(45*Math.random());    // 반환값 범위 : 0.0 <= r < 1.0을 double 타입으로 반환
//		System.out.println(rand);

		// for문으로 6번 반복
		System.out.println("로또숫자[1~45] 6개 출력하기");
		int lotto[] = new int[6];
		for(int cnt=0;cnt<lotto.length;cnt++) {
			lotto[cnt] = (int)(45*Math.random())+1;
			//System.out.println(rand);
			for(int index=0; index<cnt; index++) {    // 0부터 현재위치 전까지
				if(lotto[index] == lotto[cnt]) {    // 중복
					cnt--;
					break;
				}
			}
		}
		for (int i=0; i<lotto.length; i++) {
			System.out.println(lotto[i]);
		}
	}
}
