package com.my.repository;    // 저장소(자료 저장, 추가, 조회, 삭제)

import com.my.dto.Product;
import com.my.exception.AddException;

public class ProductArrayRepository {
	private Product products[];		// 저장소
	private int cnt;	// 저장소에 저장된 상품수
	
	public ProductArrayRepository(){
		products = new Product[5];
	}
	
	public ProductArrayRepository(int num){
		products = new Product[num];
	}
	/**
	 * 저장소에 상품을 추가한다
	 * @param product 상품
	 */
//	public void insert(Product product) {
//		try {    // 정상 처리
//			products[cnt++] = product;    // 가능하지만 안좋다 <- 이걸로 하면 예외가 발생했을때 cnt를 더하고 catch로 간다
//			products[cnt] = product;    // 이렇게 두 줄로 한 코드가 더 좋은 코드다
//			cnt++;
//			System.out.println("상품종류개수 : "+ cnt);
//		}catch(ArrayIndexOutOfBoundsException e) {    // 배열의 인덱스 범위를 벗어났을때예외 발생
//			System.out.println("저장소가 꽉 찼습니다. 현재 상품종료개수 : "+ cnt);
//		}
	
	// throws로 만들어보기
//	public void insert(Product product) throws ArrayIndexOutOfBoundsException{
//		products[cnt] = product;
//		cnt++;
//		System.out.println("상품종류개수 : "+ cnt);
//	}
	
	// 사용자 정의 exception으로 옮기기
	public void insert(Product product) throws AddException{
		try {
			products[cnt] = product;
			cnt++;
			System.out.println("상품종류개수 : "+ cnt);
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("저장소가 꽉 찼습니다. 현재 상품종료개수 : "+ cnt);
			throw new AddException("저장소가 꽉 찼습니다. 현재 상품종료개수 : "+ cnt);
		}
	}
	/**
	 * 저장된 상품들을 반환한다
	 * @return
	 */
	public Product[] selectAll() {
		// return products;    // 메모리보다 상품수가 적어도 그대로 리턴하여 리턴값도 리턴해버린다
		Product[] result = new Product[cnt];
		for(int i=0; i<cnt; i++) {  // 저장되어 있는 메모리만 반환(상품이 메모리 개수보다 적으면 그만큼만 리턴)
			result[i] = products[i];
		}
		return result;
	}
}
