import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.my.sql.MyConnection;

public class BatchTest {

	public static void main(String[] args) {
		Connection con = null;// DB와 연결
		PreparedStatement pstmt = null;
		
		String insertSQL = "INSERT INTO a_tbl VALUES (?)";  // SQL구문이 데이터베이스에 전달되서 준비하라고 함
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(insertSQL);
//			for(int i=101; i<=200; i++) {  // 반복문의 횟수만큼 ?의 값 보냄
//				pstmt.setInt(1, i);    // 반복문 상 101에서 200까지의 값을 보냄
//				pstmt.executeUpdate();
//			}
			// 위에거 일괄처리
			for(int i=101; i<=200; i++) {
				pstmt.setInt(1, i);
				pstmt.addBatch();    // 보낼 자료를 쌓는다. 마치 배열처럼(여기서는 100개)
			}
			pstmt.executeBatch();  // 쌓인 자료를 한번에 보낸다
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(pstmt, con);
		}
	}

}
