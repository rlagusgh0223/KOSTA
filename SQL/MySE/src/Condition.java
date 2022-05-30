/*
public class Condition{
    public static void main(String[] args){
        java.util.Scanner sc = new java.util.Scanner(System.in);
        System.out.print("점수를 입력하세요 : ");

        //int score = 93;
        int score = sc.nextInt();    // 키보드에 입력값 받음
        if(score >= 60){
            System.out.println("합격");
            if (score >= 90){
                System.out.println("1등급");
            }else if(score >= 70){
                System.out.println("2등급");
            }else{
                System.out.println("3등급");
            }
        }else{
            System.out.println("불합격");
        }

        int year = 2022;
        System.out.print("태어난 연도를 입력하세요 : ");
        int birthYear = sc.nextInt();

        int age = year - birthYear;    // 1
        // 7세 미만 영유아, 7~13세 어린이, 14~19세 청소년, 20세 이상 성인
        if(age<7){
            System.out.println("영유아");
        }else if(age<=13){
            System.out.println("어린이");
        }else if(age<=19){
            System.out.println("청소년");
        }else{
            System.out.println("성인");
        }


        // 출생년도에 해당하는 12지를 출력하시오.
        // 2022년 출생자는 호랑이, 2021-소, 2020년-쥐
        // 년도를 12로 나눈 나머지가 0이면 원숭이, 1이면 닭,
        // 2이면 개, 3이면 돼지, 4이면 쥐, 5이면 소, 6이면 호랑이,
        // 7이면 토끼, 8이면용, 9이면 뱀, 10이면 말, 11이면 양
        int score = birthYear % 12;
        if (score == 0){
            System.out.println("원숭이");
        }else if(score==1){
            System.out.println("닭");
        }else if(score==2){
            System.out.println("개");
        }else if(score==3){
            System.out.println("돼지");
        }else if(score==4){
            System.out.println("쥐");
        }else if(score==5){
            System.out.println("소");
        }else if(score==6){
            System.out.println("호랑이");
        }else if(score==7){
            System.out.println("토끼");
        }else if(score==8){
            System.out.println("용");
        }else if(score==9){
            System.out.println("뱀");
        }else if(score==10){
            System.out.println("말");
        }else{
            System.out.println("양");
        }


public class Condition{
    public static void main(String[] args){
        java.util.Scanner sc = new java.util.Scanner(System.in);

        /*
        가위바위보 게임 :
        컴퓨터가 가위를 내고 사용자가 바위를 낸 경우 "이겼습니다"를 출력
        컴퓨터가 가위를 내고 사용자가 보를 낸 경우 "졌습니다" 출력
        컴퓨터가 가위를 내고 사용자가 가위를 낸 경우 '비겼습니다"를 출력
        0 : 가위, 1: 바위, 2: 보
        */
        // user 값은 키보드로 받음


 // 첫번째 코드
        System.out.println("가위-0, 바위-1, 보-2를 입력하세요 : ");
        int user = sc.nextInt();
        int computer;
        computer = 0;
        switch(user){
        case 1:
            System.out.println("이겼습니다");
            break;
        case 2:
            System.out.println("졌습니다");
            break;
        case 0:
            System.out.println("비겼습니다");
            break;
        }
    }
}


        // 두번째 가위바위보 코드
        System.out.println("가위-0, 바위-1, 보-2를 입력하세요 : ");
        int user = sc.nextInt();
        int computer = 0;
        if(computer == user){
            System.out.println("비겼습니다");
        }else if(computer == user-1){    // user=1이면 이겼습니다라고 해도 되지만 computer랑 비교하는 코드를 원하시는 것 같아 이렇게 작성했습니다.
            System.out.println("이겼습니다");
        }else if(computer == user-2){
            System.out.println("졌습니다");
        }else{
            System.out.println("잘못 입력했습니다");
        }
        
    }
}
*/



////////////////////////////////////랜덤한 가위바위보

public class Condition{
    public static void main(String[] args){
        java.util.Scanner sc = new java.util.Scanner(System.in);
        System.out.println("가위-0, 바위-1, 보-2를 입력하세요 : ");
        int user = sc.nextInt();
        int computer = (int)(Math.random() * 100);
        computer %= 3;
        System.out.println(computer);
        if(computer == user){
            System.out.println("비겼습니다");
        }else if(computer==0 && user==2){
            System.out.println("졌습니다");
        }else if(computer==2 && user==0){
            System.out.println("이겼습니다");
        }else if(computer < user){
            System.out.println("이겼습니다");
        }else if(computer > user){
            System.out.println("졌습니다");
        }else{
            System.out.println("잘못 입력했습니다");
        }
    }
}

// 선생님 모범답안은 ConditionT.java 볼 것