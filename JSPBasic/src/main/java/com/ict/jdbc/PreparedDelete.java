package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class PreparedDelete {

	public static void main(String[] args) {
		// 특정 아이디를 Scanner로 입력받아 입력받은 아이디를 삭제하는 로직을 작성해주세요.
		// PrepareStatement 형식으로 작성해주세요.
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "mysql";
		
		Scanner scan = new Scanner(System.in);
		System.out.println("삭제할 아이디를 입력해주세요.");
		String id = scan.nextLine();
		try {

			Class.forName(dbType);

			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			
			String del = "DELETE FROM userinfo WHERE user_id=?";
			PreparedStatement pstmt = con.prepareStatement(del);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		scan.close();
	}

}
}