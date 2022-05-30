/**
 * --상품--
 * 상품번호 F0001  G0001  L0001
 * 상품명   스콘    머그1  아메리카노
 * 상품가격 1000   2000   1000
 * 상품상세정보 "~~"
 * 상품제조일자 22/04/20
 *           220420
 *           042022
 *           2022/04/20
 *           Date
 * @author Owner
 *
 */
import java.util.Date;

import com.my.dto.Product;
import com.my.exception.AddException;
import com.my.repository.ProductArrayRepository;

public class ProductArrayManager {
	public static void main(String[] args) {
		ProductArrayRepository repository;
		repository = new ProductArrayRepository();	// 최대5개까지 저장할 수 있는 저장소를 생성한다
//		repository = new ProductRepository(10);		// 최대 10개까지 저장할 수 있는 저장소를 생성한다
//		Product p1 = new Product("D0001", "아메리카노", 1000);
//		repository.insert(p1);
//		repository.insert(new Product("D0002", "아이스아메리카노", 1500, new Date()));
//		repository.insert(new Product("D0003", "라떼", 1500, new Date()));
//		repository.insert(new Product("D0004", "아이스라떼", 1500, new Date()));
//		repository.insert(new Product("D0005", "카푸치노", 1500, new Date()));
//		System.out.println("상품종류개수 : "+repository.cnt);
//		repository.insert(new Product("D0006", "프라프치노", 1500, new Date()));

		try {
			for(int i=1; i<=10; i++) {
			// 프로그램이 5까지만 받고 종료된다(위에서 5개의 저장소만 만들었으니까)
			// ProductReposittory에서 try~catch로 받을 경우
			repository.insert(new Product("D000"+i, "상품"+i, 1500, new Date()));
			
			// ProductReposittory에서 throws로 받을 경우 작성해야 되는 부분
			// try~catch를 for 안에서 할 경우 i가 10일때까지 반복하지만
			// 반복문 밖에서 try~catch를 할 경우 6일때만 catch를 돌고, 그 다음부터는 돌지 않는다
//			try {
//				repository.insert(new Product("D000"+i, "상품"+i, 1500, new Date()));
//			}catch(ArrayIndexOutOfBoundsException e) {
//				System.out.println("저장소가 꽉찼습니다.");
//			}
			}
		}catch(AddException e) {
			System.out.println(e.getMessage());// 제공자에서 만든 예외 메세지 받기
		}
		Product products[] = repository.selectAll();  // 저장되어있는 상품들을 반환한다
		for(int i=0; i<products.length; i++) {
			products[i].print();
			// 상품번호:D0001, 상품명:상품1, 가격:1500, 상세정보:null, 제조일자:~~가 출력됨
			// 상품번호:D0002, 상품명:상품2, 가격:1500, 상세정보:null, 제조일자:~~가 출력됨
			// 상품번호:D0003, 상품명:상품3, 가격:1500, 상세정보:null, 제조일자:~~가 출력됨
			// 상품번호:D0004, 상품명:상품4, 가격:1500, 상세정보:null, 제조일자:~~가 출력됨
			// 상품번호:D0005, 상품명:상품5, 가격:1500, 상세정보:null, 제조일자:~~가 출력됨
		}
	}
}



