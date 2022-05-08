package com.my.repository;

import java.util.ArrayList;
import java.util.List;

import com.my.dto.Product;
import com.my.exception.AddException;
import com.my.exception.FindException;

public class ProductListRepository {
	private List<Product> products;
	public ProductListRepository() {
		products = new ArrayList<>(); //10개의 index가 제공
	}
	public ProductListRepository(int size){
		products = new ArrayList<>(size); //size개수의 index가 제공
	}
	public void insert(Product product) throws AddException{
		String prodNo = product.getProdNo();
		int i=0;
		for(; i<products.size(); i++) {
			Product p = products.get(i);
			if(prodNo.equals(p.getProdNo())) {
				break;
			}
		}
		if(i == products.size()) {
			products.add(product);
		}else {
			throw new AddException("이미 존재하는 상품입니다");
		}
		
	}
	public List<Product> selectAll() throws FindException{
		if (products.size() == 0) {
			throw new FindException("상품이 없습니다");
		}
		return products;
	}
	
	public Product selectByProdNo(String prodNo) throws FindException{
		for (Product p: products) {
			if(p.getProdNo().equals(prodNo)) {
				return p;
			}
		}
		throw new FindException("상품이 없습니다");
	}
	
	public void searchNo(String prodNo) throws FindException{
		int cnt = 0;
		for (Product p: products) {
			if(p.getProdNo().contains(prodNo)) {   // 받은 문자열이 상품번호의 일부 문자열이라면
				System.out.println(p);    // 현재 문자열 출력
				cnt = 1;    // 출력했다는 표시(return으로 하면 여러줄 출력 못한다)
			}else if(p.getProdName().contains(prodNo)) {    // 받은 문자열이 상품명의 일부 문자열이라면
				System.out.println(p);
				cnt = 1;
			}
		}
		if (cnt == 0) {    // 일부가 맞는 문자열이 없어 출력하지 않은 경우 출력
			throw new FindException("상품이 없습니다");
		}
	}
	
	public Product modify(String prodNo) throws FindException{
		for (Product p: products) {
			if(p.getProdNo().equals(prodNo)) {
				return p;
			}
		}
		throw new FindException("상품이 없습니다");
	}

}