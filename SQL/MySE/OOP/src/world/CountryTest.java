package world;
import world.asia.Korea;
import world.asia.Japen;
import java.util.Date;
import java.util.Scanner;
// import java.lang.String;		// 컴파일시에 자동 포함
public class CountryTest {
	public static void main(String[] args) {
//		world.asia.Korea k;
//		k = new world.asia.Korea();
		Korea k;
		k = new Korea();
		Japen j = new Japen();
		
		Date d1 = new Date();
		Scanner sc = new Scanner(System.in);
		
		java.sql.Date d2;
		
//		k.language = "일본어";
//		k.capital = "평양";
//		k.population = -1;
		k.setPopulation(-1);
	}
}
