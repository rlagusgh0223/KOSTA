package net.client;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ConnectException;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Scanner;

public class TCPClientTest {
	public static void main(String[] args) {
		String serverIP = "127.0.0.1";    // 내 컴퓨터에 접속하고 싶다
		int serverPORT = 5432;
		Socket s = null;
		DataOutputStream dos = null;
		Scanner sc = new Scanner(System.in);
		try {
			s = new Socket(serverIP, serverPORT);
			dos = new DataOutputStream(s.getOutputStream());

			
			// 키보드로 입력된 문자열이 'quit'인 경우까지 송신
//			String sendData = "";
//			while(!sendData.equals("quit")) {
//				sendData = sc.nextLine();
//				dos.writeUTF(sendData);
//			}
			// 선생님 코드
			String sendData = null;
			do {
				sendData = sc.nextLine();
				dos.writeUTF(sendData);
			}while(!sendData.equals("quit"));
			
			
//			String sendData = "hello";
//			dos.writeUTF(sendData);
//			dos.writeUTF(sendData);
			
//			// 위의 코드 대신 키보드에서 값 입력 받기
//			String sendData = sc.nextLine();
//			dos.writeUTF(sendData);
		} catch (UnknownHostException e) {
			System.out.println("IP가 잘못되었거나 호스트명이 잘못되었습니다.");
		} catch (ConnectException e) {
			System.out.println("서버와의 연결을 실패하였습니다.");
		} catch(SocketException se) {    // ConnectException의 부모
			System.out.println("소켓이 끊겼습니다. 서버장애인지 확인하세요.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}