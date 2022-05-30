public class Operator{
    public static void main(String[] args){
        //산술연산자
        int a, b, c;
        a = 10; b = 3;
        c = a+b;
        System.out.println(c);    // 13
        c = a%b;
        System.out.println(c);    // 1

        short s1, s2, s3;
        s1 = 10; s2 = 3;
        // s3 = s1 + s2;    // 컴파일 오류 발생됨
        // s1+s2의 결과값은 int인데 short에 넣으려고 하니 오류남
        // 4byte보다 작은 자료형은 연산되면 자동으로 연산 가능한 타입으로 바뀐다 ex. short 연산 -> int
        s3 = (short)(s1 + s2);    // 컴파일 성공
        System.out.println(s3);

        float f;
        a = 10; b = 3;
        f = a + b;
        System.out.println(f);    // 13.0

        a = 10; b = 3;
        f = a / b;
        System.out.println(f);    // 3.0 <- int를 int로 나눈 결과는 int인데 그 결과를 float으로 한거니까 3.0이 된다

        f = (float)a/b;    // 둘 다 바꿀 필요 없이 둘 중 하나만 바꿔도 float와 int의 연산 결과를 출력하므로 float값이 나온다
        System.out.println(f);    // 3.3333



        // 대입연산자
        a += 10;
        System.out.println(a);    // 20



        // 비교 연산자
        a = 10;
        System.out.println(a%2 == 0);    // true
        a = 8;
        System.out.println(a%2 == 0);    // true
        b = 3;
        System.out.println(b%2 == 1);    // true
        System.out.println(b%2 != 0);    // true
        System.out.println(a > b);    // true



        // 논리연산자
        System.out.println(true && true);    // true
        System.out.println(true & true);    // true
        // 위의 결과는 서로 같다. 단, &&는 좀더 빠른 연산을 한다
        // && 왼쪽이 false이면 오른쪽을 연산에 참여시키지 않는다
        // &는 왼쪽이 false여도 오른쪽을 연산에 참여시킨다
        // &는 오른쪽의 값이 연산에 상관없이 필요한 경우 쓴다
        // 그래서 &는 별로 쓰일 일이 없다

        System.out.println(0 & 1);
        // 참여하는 자료형이 숫자이면 비트연산



        // 단항연산자
        a = 10;
        a++;
        System.out.println(a);    // 11

        a = 10;
        a--;
        System.out.println(a);    // 9

        a = 10;
        b = a++;
        System.out.println(b);    // 10
        System.out.println(a);    // 11

        a = 10;
        b = ++a;
        System.out.println(b);    // 11
        System.out.println(a);    // 11

        //
        byte b1;
        b1 = 127;
        b1++;
        System.out.println(b1);    // -128 <- 최댓값인 127을 넘었으므로 최솟값이 -128에서부터 다시 시작한다

        // 삼항연산자
        a = 10;
        System.out.println(a % 2 == 0 ? "짝수" : "홀수");
    }
}