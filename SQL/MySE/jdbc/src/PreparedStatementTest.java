import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import com.my.sql.MyConnection;

public class PreparedStatementTest {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Connection con = null;
		Statement stmt = null;
		
		PreparedStatement pstmt = null;
		try {
			con = MyConnection.getConnection();
			//stmt = con.createStatement();
			String inserSQL = "INSERT INTO customer(id, pwd, name, status)"
					+ " VALUES(?, ?, ?, ?)";
			pstmt = con.prepareStatement(inserSQL);
			
			System.out.print("추가할 아이디를 입력하세요 : ");
			String id = sc.nextLine();

			System.out.print("추가할 비밀번호를 입력하세요 : ");
			String pwd = sc.nextLine();

			System.out.print("추가할 이름을 입력하세요 : ");
			String name = sc.nextLine();
			
			System.out.print("일반고객이면 1, 기업고객이면 2");
			int status = sc.nextInt();
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setInt(4, status);
			pstmt.executeUpdate();
			System.out.println("고객등록완료");
//			String insertSQL = "INSERT INTO customer(id, pwd, name) "
//					+ "VALUES ('" + id + "', '" + pwd + "', '" + name + "')";
//			stmt.executeUpdate(insertSQL);
		} catch (SQLException e) {
			e.printStackTrace();
			return;
		} finally {
			MyConnection.close(pstmt, con);
		}
	}
}