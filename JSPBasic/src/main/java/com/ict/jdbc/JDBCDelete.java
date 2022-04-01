package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCDelete {

	public static void main(String[] args) {
			Scanner scan = new Scanner(System.in);
			System.out.println("삭제할 아이디를 입력해주세요.");
			String id = scan.nextLine();
		try {
			// 1. JDBC 연동
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														"root", 
														"mysql");
			Statement stmt = con.createStatement(); // java.sql의 요소를 사용합니다.
			// String sql = "DELETE FROM userinfo WHERE user_id='" + id + "'";
			// System.out.println("실행될 쿼리문 : " + sql);
			stmt.executeUpdate("DELETE FROM userinfo WHERE user_id = '" + id + "'");
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		scan.close();
	}

	}

}
