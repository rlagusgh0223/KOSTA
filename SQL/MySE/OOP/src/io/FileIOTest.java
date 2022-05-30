package io;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileIOTest {
	public static void readNWriteByChar() {
		/*
		 * resouce : a.txt
		 * node stream : FileReader
		 */
		String fileName = "a.txt";
		FileReader fr = null;
		/*
		 * dest : acopy1.txt
		 * node stream : FileWriter
		 */
		String copyFileName = "acopy1.txt";
		FileWriter fw = null;
		try {
			fr = new FileReader(fileName);
			fw = new FileWriter(copyFileName);
			int readValue = -1;
			while((readValue = fr.read()) != -1) {
				fw.write(readValue);
			}
//			fw.flush();
//			fw.close();    // flush(;) + 연결끊기
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(fr != null) {
				try {
					fr.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			if(fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	public static void readNWriteByByte() {
		/*
		 * resource(자원) : a.txt파일 
		 * node stream : FileInputStream
		 */
		String fileName = "a.txt";    // 현재경로(OOP에 있는 파일) - .\\a.txt와 같음
		FileInputStream fis = null;
		/*
		 * 출력
		 * 출력할 곳(dest) : acopy.txt
		 * node stream : FileOutputStream 
		 */
		String copyFileName = "acopy.txt";
		FileOutputStream fos = null;
		try {
			fis = new FileInputStream(fileName);    // 파일자원과의 연결
//			fos = new FileOutputStream(copyFileName);    // 파일목적지와의 연결. 파일이 만들어짐(있어도 새로 만듦)
			fos = new FileOutputStream(copyFileName, true);    // 파일이 있으면 뒤에 이어서 만들어짐
			
			int readValue = -1;
			while((readValue = fis.read()) != -1) {
//				System.out.println((char)readValue);
				fos.write(readValue);
			}
		} catch (FileNotFoundException e) {    // 하위 Exception이 먼저 나온다
//			e.printStackTrace();
			System.out.println("a.txt파일이 없습니다");
		} catch (IOException e) {    // 상위 Exception이 나중
			e.printStackTrace();
		}
	}
	public static void main(String[] args){
//		readNWriteByByte();
		readNWriteByChar();
	}
}