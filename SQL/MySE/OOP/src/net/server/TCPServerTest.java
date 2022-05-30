package net.server;

import java.io.DataInputStream;
import java.io.IOException;
import java.net.BindException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;

public class TCPServerTest {
	public static void main(String[] args) {
		int port = 5432;
		ServerSocket ss = null;
		
		try {
			// 1. port 열기
			ss = new ServerSocket(port);
			while(true) {    // 죽지 않는 서버를 만들기 위한 반복문
				Socket s = null;
				DataInputStream dis = null;
				String clientIP = null;    // 접속한 클라이언트의 IP를 받을 변수
				try {
				// 2. 클라이언트 기다리기, 소켓생성
					s = ss.accept();
					InetAddress client = s.getInetAddress();
					clientIP = client.getHostAddress();
					dis = new DataInputStream(s.getInputStream());
			// 키보드로 입력된 문자열이 'quit'인 경우까지 송신
			// 선생님 코드
					String receiveData = null;
					while(!(receiveData = dis.readUTF()).equals("quit")) {
						System.out.println(clientIP + "가 보내준 내용:" + receiveData);
					}
				} catch(SocketException e) {    // BindException의 부모
//					System.out.println("소켓이 끊겼습니다."); - 굳이 설명 쓸 필요 없다. 사용자가 그냥 강제 종료한걸 수 도 있으니까
				} catch(IOException e) {
					// 이건 안쪽의 try에 대한 IOException
				} finally {
					if(s != null) {
						try {
							s.close();
						} catch(IOException e) {
						}
					}
					System.out.print(clientIP==null?"클라이언트":clientIP);
					System.out.println("와 연결을 종료합니다.");
				}
			}
			// 키보드로 입력된 문자열이 'quit'인 경우까지 송신 - 내 코드
//			String receiveData = "";
//			while(!receiveData.equals("quit")) {
//				receiveData = dis.readUTF();
//				System.out.println("클라이언트가 보내준 내용 : "+receiveData);
//			}

			
			
//			receiveData = dis.readUTF();
//			System.out.println("클라이언트가 보내준 내용 : "+receiveData);
//			receiveData = dis.readUTF();
//			System.out.println("클라이언트가 보내준 내용 : "+receiveData);
		} catch (BindException e) {
			System.out.println(port+"포트가 이미 사용중입니다.");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(ss != null) {
				try {
					ss.close();
				} catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}