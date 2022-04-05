package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class PreparedUpdate {

	public static void main(String[] args) {
		// id, pw, name, email을 입력 받아서
		// 특정 id인 계정의 pw, name, email을 입력받은 값으로 갱신하는
		// UPDATE 로직을 작성해주세요.
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "mysql";
		
		
		Scanner scan = new Scanner(System.in);
		System.out.println("수정할 아이디를 입력해d세요.");
		String id = scan.nextLine();
		System.out.println("새로운 비번을 입력해주세요.");
		String pw = scan.nextLine();
		System.out.println("새로운 이름을 입력해주세요.");
		String name = scan.nextLine();
		System.out.println("새로운 이메일을 입력해주세요.");
		String email = scan.nextLine();
		try {
			Class.forName(dbType);

			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			String update = "UPDATE userinfo SET user_pw= ?, user_name= ?, email= ? WHERE user_id = ?";
			PreparedStatement pstmt = con.prepareStatement(update);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		}
	}

}
