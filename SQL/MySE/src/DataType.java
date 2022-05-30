/**
클래스에 대한 사용 설명서 쓰면 됨
ex. 자바의 자료형에 대한 실습코드입니다
*/
public class DataType{
    /**
      메인 메서드는 클래스 실행시 진입점의 역할을 하는 메서드이다.
    */
    public static void main(String[] args){
        byte b;
        b = 1;
        System.out.println(b);    // 1
        //b = 128;    // byte 범위는 -128 ~ 127까지이다.
        
        // 정수 -> 정수 자동형변환
        short sh;
        sh = b;
        System.out.println(sh);    // 1

        // 실수자료형
        float f;
        //f = 1234.567;
        f = 1234.567F;    // 소문자 f도 가능

        long lon;
        //lon = 123456789123456789;
        lon = 123456789123456789L;

        // 정수 -> 실수 자동형변환
        sh = 1234;
        f = sh;
        System.out.println(sh);    // 1234
        System.out.println(f);    // 1234.0

        // 실수 -> 정수 형변환
        //sh = f;    // 자동형변환 안됨
        sh = (short)f;    // 강제형변환
        System.out.println(sh);    // 1234
        b = (byte)f;    // 강제형변환(큰놈이 작은놈으로 변환할땐 뒤에서부터 강제형변환과 맞는 값으로 보낸다. 그런데 여기선 1인가 보다. 음수인 1이 와서 -46이 나온다)
        System.out.println(b);    // -46

        /* 여러줄 주석
        // 단일문자형 2Byteunicode
        char c = 'A';
        int i = c;    // 자동형변환
        System.out.println(i); // A의 아스키코드 출력

        // 논리형
        boolean flag;
        flag = true;
        // flag = 11;    // 컴파일 오류
        */
        
    }
}