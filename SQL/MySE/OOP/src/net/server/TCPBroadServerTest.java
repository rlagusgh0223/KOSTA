package net.server;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.BindException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.List;
import java.util.Vector;
class TCPBroadThread extends Thread{
	private Socket s;
	private DataInputStream dis = null;
	private DataOutputStream dos = null;
	private String clientIP = null;
	private List<TCPBroadThread> list;
	public TCPBroadThread(Socket s, List<TCPBroadThread> list) throws IOException{
		this.s = s;
		this.list = list;
		// 스레드가 시작되기 전에 초기화
		InetAddress client = s.getInetAddress();
		clientIP = client.getHostAddress();
		dis = new DataInputStream(s.getInputStream());
		dos = new DataOutputStream(s.getOutputStream());
		
		// 누군가가 접속하면 다른 클라이언트들에게 누가 접속했다고 알려주는 반복문
//		for(int i=0; i<list.size(); i++) {
//			TCPBroadThread t = list.get(i);
//			t.dos.writeUTF(clientIP + "가 접속했습니다");
//		}
		broadcast(clientIP + "가 접속했습니다");
	}
	
	// 누군가가 접속하면 다른 클라이언트들에게 누가 접속했다고 알려주는 메소드
	public void broadcast(String msg) {
		// 아래 코드가 많이 쓰이니 메소드로 만듦
		for(int i=0; i<list.size(); i++) {
			TCPBroadThread t = list.get(i);
			try{
				t.dos.writeUTF(msg);
			} catch(Exception e) {
				
			}
			
		}
	}
	public void run() {
		try {
			String receiveData = null;
			while(!(receiveData = dis.readUTF()).equals("quit")) {
				broadcast(clientIP + ">" + receiveData);
			}
		} catch(SocketException e) {
		} catch(IOException e) {
		} finally {
			list.remove(this);    // 연결이 끊긴 스레드를 리스트에서 제거하여 다른 스레드에서 연결하지 않게 한다
			if(s != null) {
				try {
					s.close();    // 이게 있으니까 doc.close(); 따로 안해도 된다
				} catch(IOException e) {
				}
			}
			broadcast(clientIP + "와 연결을 종료합니다");
		}
	}
}
public class TCPBroadServerTest {
	public static void main(String[] args) {
		int port = 5432;
		ServerSocket ss = null;
		try {
			// 1. port 열기
			ss = new ServerSocket(port);
			// List 생성
			List<TCPBroadThread> list = new Vector<>();
			while(true) {
				Socket s = null;
				try {
				// 2. 클라이언트 기다리기, 소켓생성
					s = ss.accept();
					// 새로운 스레드 생성
					TCPBroadThread t = new TCPBroadThread(s, list);
					list.add(t);
					// 스레드 시작
					t.start();
				} catch(IOException e) {
					
				}
			}
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