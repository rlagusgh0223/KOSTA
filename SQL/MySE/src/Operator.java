public class Operator{
    public static void main(String[] args){
        //���������
        int a, b, c;
        a = 10; b = 3;
        c = a+b;
        System.out.println(c);    // 13
        c = a%b;
        System.out.println(c);    // 1

        short s1, s2, s3;
        s1 = 10; s2 = 3;
        // s3 = s1 + s2;    // ������ ���� �߻���
        // s1+s2�� ������� int�ε� short�� �������� �ϴ� ������
        // 4byte���� ���� �ڷ����� ����Ǹ� �ڵ����� ���� ������ Ÿ������ �ٲ�� ex. short ���� -> int
        s3 = (short)(s1 + s2);    // ������ ����
        System.out.println(s3);

        float f;
        a = 10; b = 3;
        f = a + b;
        System.out.println(f);    // 13.0

        a = 10; b = 3;
        f = a / b;
        System.out.println(f);    // 3.0 <- int�� int�� ���� ����� int�ε� �� ����� float���� �ѰŴϱ� 3.0�� �ȴ�

        f = (float)a/b;    // �� �� �ٲ� �ʿ� ���� �� �� �ϳ��� �ٲ㵵 float�� int�� ���� ����� ����ϹǷ� float���� ���´�
        System.out.println(f);    // 3.3333



        // ���Կ�����
        a += 10;
        System.out.println(a);    // 20



        // �� ������
        a = 10;
        System.out.println(a%2 == 0);    // true
        a = 8;
        System.out.println(a%2 == 0);    // true
        b = 3;
        System.out.println(b%2 == 1);    // true
        System.out.println(b%2 != 0);    // true
        System.out.println(a > b);    // true



        // ��������
        System.out.println(true && true);    // true
        System.out.println(true & true);    // true
        // ���� ����� ���� ����. ��, &&�� ���� ���� ������ �Ѵ�
        // && ������ false�̸� �������� ���꿡 ������Ű�� �ʴ´�
        // &�� ������ false���� �������� ���꿡 ������Ų��
        // &�� �������� ���� ���꿡 ������� �ʿ��� ��� ����
        // �׷��� &�� ���� ���� ���� ����

        System.out.println(0 & 1);
        // �����ϴ� �ڷ����� �����̸� ��Ʈ����



        // ���׿�����
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
        System.out.println(b1);    // -128 <- �ִ��� 127�� �Ѿ����Ƿ� �ּڰ��� -128�������� �ٽ� �����Ѵ�

        // ���׿�����
        a = 10;
        System.out.println(a % 2 == 0 ? "¦��" : "Ȧ��");
    }
}