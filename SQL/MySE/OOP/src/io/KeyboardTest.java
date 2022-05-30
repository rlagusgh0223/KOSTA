package io;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

public class KeyboardTest {
	public static void main(String[] args) {
		InputStream is = System.in;    // 노드스트림
//		try {
//			int readValue = is.read();    // byte 단위 읽기(문자열의 첫글자에 대한 첫바이트만 읽는다)
//			System.out.println(readValue+" = "+(char)readValue);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
//		Reader r = new InputStreamReader(is);    // 필터스트림
//		try {
//			int readValue = -1;
//			while((readValue = r.read()) != -1) {    // char 단위로 읽기
//				System.out.println(readValue+" = "+(char)readValue);    // 콘솔스트림끝:ctrl+z
//			}// ctrl+z누르면 종료, 엔터누르면 계속인데 엔터에 대한 아스키코드도 나온다(13,10)
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		Reader r = new InputStreamReader(is);
		try {
			int readCnt = -1;
			char cbuf[] = new char[3];    // 3개의 문자씩 읽어오게 할 char 배열
			int off = 0;
			int len = cbuf.length;
			while((readCnt = r.read(cbuf, off, len)) != -1) {//cbuf의 0번부터 마지막 인덱스까지 채워라
//				for(char c: cbuf) {
				
				// readCnt만큼 읽어오기
//				for(int i=0;i<readCnt;i++) {
//					System.out.println(cbuf[i]);
//				}
//				System.out.println("---");
				
				// 할때마다 초기화?
				System.out.println(new String(cbuf, 0, readCnt));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}