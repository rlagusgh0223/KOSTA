package com.my.repository;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.my.dto.Product;
import com.my.exception.AddException;
import com.my.exception.FindException;

public class ProductFileRepository implements ProductRepository{
	private String fileName = "products.txt";
	public ProductFileRepository() {
	}
	public void insert(Product product) throws AddException{
		File file = new File("products.txt");    // products.txt를 file객체로 생성
		if(!file.exists()) {     // file(products.txt)이 없을 경우
			try {
				file.createNewFile();    // products.txt를 만들고 file객체로 생성한다
			} catch (IOException e) {
				e.printStackTrace();
				throw new AddException("파일을 만들 수 없습니다");    // 파일을 만들 수 없다면 에러 메시지 반환
			}
		}
		FileWriter fw = null;
		Scanner sc = null;
		try {    
			sc = new Scanner(new FileInputStream(fileName));
			while(sc.hasNextLine()) {    // while((sc.hasNextLine() == true)
				String line = sc.nextLine();    // 상품에 대한 내용이 있는한 한 줄씩 계속 읽는다
				String arr[] = line.split(":", 3);
				String prodNo = product.getProdNo();
				String arr0 = arr[0];
				if (prodNo.equals(arr0)) {
					throw new AddException("이미 존재하는 상품입니다");
				}
			}
					
			fw = new FileWriter(file, true);
			fw.write(product.getProdNo()+":"+product.getProdName()+":"+product.getProdPrice()+"\n");
		} catch (IOException e) {    // products.txt가 없으면 여기로 온다(파일이 존재하지 않을때)
			e.printStackTrace();
			throw new AddException("파일이 존재하지 않습니다");
		} finally {			
			if(fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(sc != null) {
				sc.close();
			}
		}
	}
	
	public List<Product> selectAll() throws FindException{
		Scanner sc = null;
		try {
			sc = new Scanner(new FileInputStream(fileName));
			List<Product> all = new ArrayList<>();
			while(sc.hasNextLine()) {    // while((sc.hasNextLine() == true)
				String line = sc.nextLine();    // 상품에 대한 내용이 있는한 한 줄씩 계속 읽는다
				String arr[] = line.split(":", 3);
				String prodNo = arr[0];
				String prodName = arr[1];
				int prodPrice = Integer.parseInt(arr[2]);
				Product p = new Product(prodNo, prodName, prodPrice);
				all.add(p);    // 상품들이 하나씩 all리스트에 저장됨
			}
			if(all.size() == 0) {    // 반복을 한번도 안돎 == 파일은 있는데 내용은 없음
				throw new FindException("상품이 없습니다");
			}
			// 리턴-finally-all 순서로 동작
			return all;    // 하나라도 내용이 있어서 입력했다면 리턴
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			// finally-throw 순서로 동작
			throw new FindException("상품이 없습니다");    // 원래 발생한 에러는 아니지만 개발자에게는 이걸 보낸다
		} finally {
			if(sc != null) {
				sc.close();
			}
		}
	}
	
	public Product selectByProdNo(String prodNo) throws FindException{
		Scanner sc = null;
		try {
			sc = new Scanner(new FileInputStream(fileName));
			while(sc.hasNextLine()) {
				String line = sc.nextLine();
				String arr[] = line.split(":", 3);
				String thisProdNo = arr[0];
				String prodName = arr[1];
				int prodPrice = Integer.parseInt(arr[2]);
				if (thisProdNo.equals(prodNo)) {
					Product p = new Product(thisProdNo, prodName, prodPrice);
					return p;
				}
				
			}
			throw new FindException("상품이 없습니다");

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new FindException("상품이 없습니다");
		} finally {
			if(sc != null) {
				sc.close();
			}
		}
	}
	
	public List<Product> selectByProdNoOrProdName(String word) throws FindException{
		Scanner sc = null;
		try {
			sc = new Scanner(new FileInputStream(fileName));
			List<Product> all = new ArrayList<>();
			while(sc.hasNextLine()) {
				String line = sc.nextLine();
				String arr[] = line.split(":", 3);
				String prodNo = arr[0];
				String prodName = arr[1];
				int prodPrice = Integer.parseInt(arr[2]);
				if (prodNo.contains(word) || prodName.contains(word)) {
					Product p = new Product(prodNo, prodName, prodPrice);
					all.add(p);
				}
			}
			if(all.size() == 0) {
				throw new FindException("상품이 없습니다");
			}
			return all;

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new FindException("상품이 없습니다");
		} finally {
			if(sc != null) {
				sc.close();
			}
		}
	}
}
