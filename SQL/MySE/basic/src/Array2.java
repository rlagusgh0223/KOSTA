
public class Array2 {

	public static void main(String[] args) {
		int arr[][] = new int[3][4];
//		arr[0][0] = 1;
//		arr[0][1] = 2;
//		arr[0][2] = 3;
//		arr[0][3] = 4;
//
//		arr[1][0] = 1;
//		arr[1][1] = 2;
//		arr[1][2] = 3;
//		arr[1][3] = 4;
//
//		arr[2][0] = 1;
//		arr[2][1] = 2;
//		arr[2][2] = 3;
//		arr[2][3] = 4;
		
		// 1. 위의 결과가 나오도록 반복문으로 수행
		// 2. 위의 내용이 들어간 결과를 행열 구분하여 출력
		for (int i=0; i<arr.length; i++) {
			for (int j=0; j<arr[i].length;j++) {
				arr[i][j] = j+1;
				// 1. System.out.println("arr["+ i +"]["+j+"] = "+arr[i][j]);
				System.out.print(arr[i][j]);
			}
			System.out.println();
		}
		System.out.println("=============================");
		//////////////////////////////////////////////
		//1  2  3  4
		//5  6  7  8
		//9 10 11 12
		// 값이 나오도록 코드 작성
		int arr2[][] = new int[3][4];
		int cnt = 0;
		for (int i=0; i<arr2.length; i++) {
			for (int j=0; j<arr2[0].length; j++) {
				cnt++;
				arr2[i][j] = cnt;
				System.out.print(arr2[i][j]+" ");
			}
			System.out.println();
		}

		System.out.println("=============================");

		//1  4  7  10 
		//2  5  8  11
		//3  6  9  12
		// 이렇게 나오도록 출력
		int arr3[][] = new int[3][4];
		int cnt1 = 0;
		for (int i=0; i<arr3[0].length; i++) {
			for (int j=0; j<arr3.length; j++) {
				cnt1++;
				arr3[j][i]=cnt1;
			}
		}
		for (int i=0;i<arr3.length;i++) {
			for (int j=0;j<arr3[0].length;j++) {
				System.out.print(arr3[i][j]+" ");
			}
			System.out.println();
		}
		
		System.out.println("=============================");

		//A B C D
		//E F G H
		//I J K L
		char arr4[][] = new char[3][4];
		char english = 'A';
		for (int i=0;i<arr4.length;i++) {
			for (int j=0;j<arr4[0].length;j++) {
				arr4[i][j]=english;
				System.out.print(arr4[i][j]+" ");
				english++;
			}System.out.println();
		}
		System.out.println("=============================");

		/////////////////////////////////////////
		//1
		//2 3
		//4 5 6
		//7 8 9 10
		int arr5[][] = new int[4][];
		int cnt5 = 0;
		for (int i=0; i<arr5.length; i++) {
			arr5[i] = new int[i+1];     // 열 생성
			// 값 대입
			for (int j=0; j<arr5[i].length;j++) {
				cnt5++;
				arr5[i][j] = cnt5;
				System.out.print(arr5[i][j]+" ");
			}
			System.out.println();
		}
		System.out.println("===============================");
		int scores[][] = {{9, 8, 5},
				          {10, 3, 5},
				          {7, 10, 8},
				          {3, 2, 1},
				          {5, 6, 7}};    // 배열 초기화
		// 각 학생의 총점과 평균을 계산하시오
		// 1번학생의 총점은 000이고 평균은 000이다
		// 각 과목별 평균 출력
		for (int col=0;col<scores.length;col++) {
			int total = 0;
			float avg = 0;
			for (int num=0;num<scores[0].length;num++) {
				total += scores[col][num];
			}
			avg = total / (float)scores[col].length;
			System.out.println((col+1)+"번 학생의 총점은 "+total+"이고, 평균은 "+avg+"이다.");
		}

		
//		국어과목의 평균은 6.8
//		영어과목의 평균은 5.8
//		수학과목의 평균은 5.2
		for (int num=0;num<scores[0].length;num++) {
			int total = 0;
			float avg = 0;
			for (int col=0;col<scores.length;col++) {
				total += scores[col][num];
			}
			
//			if (num == 0) {
//				System.out.print("국어과목의 ");
//			}
//			else if (num == 1) {
//				System.out.print("영어과목의 ");
//			}
//			else if (num == 2) {
//				System.out.print("수학과목의 ");
//			}
			String word[] = {"국어", "영어", "수학"};
			avg = (float)total / scores.length;
			System.out.println(word[num] + "과목의 평균은 "+avg);
		}
		System.out.println("===============================");
		
		// arr6배열값을 회전시켜서 arr7배열에 저장하기
		// 4행 4열 1~12가 있는데 90도 회전
		
		// 두번째좌표는 3-(원래 첫번째 좌표의 길이-1)
		// 첫번째좌표는 0,1,2,3
		// 0.0 -> 0.3 / 0.1 -> 1.3 / 0.2 -> 2.3 / 0.3 -> 3.3  // x는 계속 증가, y는 3-0
		// 1.0 -> 0.2 / 1.1 -> 1.2 / 1.2 -> 2.2 / 1.3 -> 3.2  // x는 계속 증가, y는 3-1
		// 2.0 -> 0.1 / 2.1 -> 1.1 / 2.2 -> 2.1 / 2.2 -> 3.1  // x는 계속 증가, y는 3-2
		// 3.0 -> 0.0 / 3.1 -> 1.0 / 3.2 -> 2.0 / 3.3 -> 3.0  // x는 계속 증가, y는 3-3
		// 여기서 3은 (arr[6]의 열의 길이 - 1) 이다
		// 위의 코드에서 arr7을 기준으로 본다면 arr7의 x를 arr6의 y로,
		// arr7의 y를 arr6의 y 역순으로 계산할 수 있다
		// i,j 를 j,i로 바꾸는 것으로 해결된다
		int arr6[][] = {{1,2,3,4},{5,6,7,8},{9,10,11,12},{13,14,15,16}};
		int arr7[][] = new int[4][4];
		
		for (int i=0; i<arr6.length; i++) {
//			arr6[i].length-i-1을 매번 계산하면 속도떨어지니까
//			arr6[i].length-i-1은 j반복문 내에서 미리 한번만
			int now = (arr6[i].length-1)-i;
			for (int j=0; j < arr6[i].length; j++) {
				// arr7[j][arr6[i].length-i-1] = arr6[i][j];
				arr7[j][now] = arr6[i][j];
			}
		}
		for (int i=0; i<arr6.length; i++) {
			for (int j=0; j < arr6[i].length; j++) {
				if (arr7[i][j] < 10) {
					System.out.print(" "+arr7[i][j]+" ");
					continue;
				}
				System.out.print(arr7[i][j]+" ");
			}
			System.out.println();
		}
		
		
	}

}
