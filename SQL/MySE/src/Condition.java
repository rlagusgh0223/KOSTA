/*
public class Condition{
    public static void main(String[] args){
        java.util.Scanner sc = new java.util.Scanner(System.in);
        System.out.print("������ �Է��ϼ��� : ");

        //int score = 93;
        int score = sc.nextInt();    // Ű���忡 �Է°� ����
        if(score >= 60){
            System.out.println("�հ�");
            if (score >= 90){
                System.out.println("1���");
            }else if(score >= 70){
                System.out.println("2���");
            }else{
                System.out.println("3���");
            }
        }else{
            System.out.println("���հ�");
        }

        int year = 2022;
        System.out.print("�¾ ������ �Է��ϼ��� : ");
        int birthYear = sc.nextInt();

        int age = year - birthYear;    // 1
        // 7�� �̸� ������, 7~13�� ���, 14~19�� û�ҳ�, 20�� �̻� ����
        if(age<7){
            System.out.println("������");
        }else if(age<=13){
            System.out.println("���");
        }else if(age<=19){
            System.out.println("û�ҳ�");
        }else{
            System.out.println("����");
        }


        // ����⵵�� �ش��ϴ� 12���� ����Ͻÿ�.
        // 2022�� ����ڴ� ȣ����, 2021-��, 2020��-��
        // �⵵�� 12�� ���� �������� 0�̸� ������, 1�̸� ��,
        // 2�̸� ��, 3�̸� ����, 4�̸� ��, 5�̸� ��, 6�̸� ȣ����,
        // 7�̸� �䳢, 8�̸��, 9�̸� ��, 10�̸� ��, 11�̸� ��
        int score = birthYear % 12;
        if (score == 0){
            System.out.println("������");
        }else if(score==1){
            System.out.println("��");
        }else if(score==2){
            System.out.println("��");
        }else if(score==3){
            System.out.println("����");
        }else if(score==4){
            System.out.println("��");
        }else if(score==5){
            System.out.println("��");
        }else if(score==6){
            System.out.println("ȣ����");
        }else if(score==7){
            System.out.println("�䳢");
        }else if(score==8){
            System.out.println("��");
        }else if(score==9){
            System.out.println("��");
        }else if(score==10){
            System.out.println("��");
        }else{
            System.out.println("��");
        }


public class Condition{
    public static void main(String[] args){
        java.util.Scanner sc = new java.util.Scanner(System.in);

        /*
        ���������� ���� :
        ��ǻ�Ͱ� ������ ���� ����ڰ� ������ �� ��� "�̰���ϴ�"�� ���
        ��ǻ�Ͱ� ������ ���� ����ڰ� ���� �� ��� "�����ϴ�" ���
        ��ǻ�Ͱ� ������ ���� ����ڰ� ������ �� ��� '�����ϴ�"�� ���
        0 : ����, 1: ����, 2: ��
        */
        // user ���� Ű����� ����


 // ù��° �ڵ�
        System.out.println("����-0, ����-1, ��-2�� �Է��ϼ��� : ");
        int user = sc.nextInt();
        int computer;
        computer = 0;
        switch(user){
        case 1:
            System.out.println("�̰���ϴ�");
            break;
        case 2:
            System.out.println("�����ϴ�");
            break;
        case 0:
            System.out.println("�����ϴ�");
            break;
        }
    }
}


        // �ι�° ���������� �ڵ�
        System.out.println("����-0, ����-1, ��-2�� �Է��ϼ��� : ");
        int user = sc.nextInt();
        int computer = 0;
        if(computer == user){
            System.out.println("�����ϴ�");
        }else if(computer == user-1){    // user=1�̸� �̰���ϴٶ�� �ص� ������ computer�� ���ϴ� �ڵ带 ���Ͻô� �� ���� �̷��� �ۼ��߽��ϴ�.
            System.out.println("�̰���ϴ�");
        }else if(computer == user-2){
            System.out.println("�����ϴ�");
        }else{
            System.out.println("�߸� �Է��߽��ϴ�");
        }
        
    }
}
*/



////////////////////////////////////������ ����������

public class Condition{
    public static void main(String[] args){
        java.util.Scanner sc = new java.util.Scanner(System.in);
        System.out.println("����-0, ����-1, ��-2�� �Է��ϼ��� : ");
        int user = sc.nextInt();
        int computer = (int)(Math.random() * 100);
        computer %= 3;
        System.out.println(computer);
        if(computer == user){
            System.out.println("�����ϴ�");
        }else if(computer==0 && user==2){
            System.out.println("�����ϴ�");
        }else if(computer==2 && user==0){
            System.out.println("�̰���ϴ�");
        }else if(computer < user){
            System.out.println("�̰���ϴ�");
        }else if(computer > user){
            System.out.println("�����ϴ�");
        }else{
            System.out.println("�߸� �Է��߽��ϴ�");
        }
    }
}

// ������ �������� ConditionT.java �� ��