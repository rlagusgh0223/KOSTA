/**
Ŭ������ ���� ��� ���� ���� ��
ex. �ڹ��� �ڷ����� ���� �ǽ��ڵ��Դϴ�
*/
public class DataType{
    /**
      ���� �޼���� Ŭ���� ����� �������� ������ �ϴ� �޼����̴�.
    */
    public static void main(String[] args){
        byte b;
        b = 1;
        System.out.println(b);    // 1
        //b = 128;    // byte ������ -128 ~ 127�����̴�.
        
        // ���� -> ���� �ڵ�����ȯ
        short sh;
        sh = b;
        System.out.println(sh);    // 1

        // �Ǽ��ڷ���
        float f;
        //f = 1234.567;
        f = 1234.567F;    // �ҹ��� f�� ����

        long lon;
        //lon = 123456789123456789;
        lon = 123456789123456789L;

        // ���� -> �Ǽ� �ڵ�����ȯ
        sh = 1234;
        f = sh;
        System.out.println(sh);    // 1234
        System.out.println(f);    // 1234.0

        // �Ǽ� -> ���� ����ȯ
        //sh = f;    // �ڵ�����ȯ �ȵ�
        sh = (short)f;    // ��������ȯ
        System.out.println(sh);    // 1234
        b = (byte)f;    // ��������ȯ(ū���� ���������� ��ȯ�Ҷ� �ڿ������� ��������ȯ�� �´� ������ ������. �׷��� ���⼱ 1�ΰ� ����. ������ 1�� �ͼ� -46�� ���´�)
        System.out.println(b);    // -46

        /* ������ �ּ�
        // ���Ϲ����� 2Byteunicode
        char c = 'A';
        int i = c;    // �ڵ�����ȯ
        System.out.println(i); // A�� �ƽ�Ű�ڵ� ���

        // ����
        boolean flag;
        flag = true;
        // flag = 11;    // ������ ����
        */
        
    }
}