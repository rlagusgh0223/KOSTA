import java.util.List;
import java.util.Scanner;

import com.my.dto.Product;
import com.my.exception.AddException;
import com.my.exception.FindException;
//import com.my.exception.ModifyException;
import com.my.repository.ProductListRepository;

public class ProductManagerConsole {
	//TODO완성하세요
	//ProductListRepository도 완성하세요
	private ProductListRepository repository = new ProductListRepository();
	private Scanner sc = new Scanner(System.in);
	public void add() {
		System.out.println(">>상품등록<<");
		System.out.print("상품번호를 입력하세요 : ");
		String prodNo = sc.nextLine();
		System.out.print("상품명을 입력하세요 : ");
		String prodName = sc.nextLine();
		System.out.print("상품가격을 입력하세요 : ");
		String strPrice = sc.nextLine();
		
		try {
			if(strPrice.length()!=0) {
				int prodPrice = Integer.parseInt(strPrice);
				repository.insert(new Product(prodNo, prodName, prodPrice));
				System.out.println("입력완료");
			}
		}catch(AddException ae) {
			System.out.println(ae.getMessage());
		}
	}
	
	
	
	public void findAll() {
		System.out.println(">>상품 전체조회<<");
		try {
			List<Product> list = repository.selectAll();
			for(int i=0; i<list.size(); i++) {
				Product p = list.get(i);
				System.out.println(p);    // p.toString() 자동호출됨
			}
		}catch(com.my.exception.FindException e) {
			System.out.println(e.getMessage());    // 상품이 없습니다
		}
	}
	
	
	
	public void findByProdNo() {
		System.out.println(">>상품번호로 조회<<");
		System.out.print("상품번호를 입력하세요 : ");
		String prodNo = sc.nextLine();
		try {
			Product p = repository.selectByProdNo(prodNo);
			System.out.println(p);
		}catch(FindException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	
	public void findByProdNoOrName() {
		System.out.println(">>상품번호나 이름으로 조회<<");
		System.out.print("검색어를 입력하세요 : ");
		String prodNo = sc.nextLine();
		try {
			repository.searchNo(prodNo);
		}catch(FindException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void modify() {
		System.out.println(">>상품 수정<<");
		System.out.print("상품번호를 입력하세요 : ");
		String prodNo = sc.nextLine();
		try {
			Product p = repository.modify(prodNo);
			System.out.println(p);
			System.out.println("상품명["+p.getProdName()+"]변경 안하려면 Enter를 누르세요");
			String name = sc.nextLine();
			p.setProdName(name);
			System.out.println("상품가격["+p.getProdPrice()+"]변경 안하려면 Enter를 누르세요");
			String price = sc.nextLine();
			if (price.length() != 0) {
				int Price = Integer.parseInt(price);
				p.setProdPrice(Price);
			}
		}catch(FindException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	
	public static void main(String[] args) {
		ProductManagerConsole managerConsole = new ProductManagerConsole();
		
		while(true) {
			System.out.println("작업구분 :상품등록-1, 상품전체조회-2, 상품번호로 조회-3, 검색어로 조회-4, 상품수정-5, 종료-9");
			Scanner sc = new Scanner(System.in);
		
			String opt = sc.nextLine();
			switch(opt) {
			case "1": 
				managerConsole.add();
				break;
			case "2":
				managerConsole.findAll();
				break;
			case "3":
				managerConsole.findByProdNo();
				break;
			case "4":
				managerConsole.findByProdNoOrName();
				break;
			case "5":
				managerConsole.modify();
				break;
			case "9":
				System.exit(0);
			}
		}
	}

}
