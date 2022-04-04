package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class PreparedInsert {
	
	public static void main(String[] args) {
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "mysql";
		
		Scanner scan = new Scanner(System.in);
		System.out.println("ID : ");
		String id = scan.nextLine();
		System.out.println("비밀번호 : ");
		String pw = scan.nextLine();
		System.out.println("이름 : ");
		String name = scan.nextLine();
		System.out.println("email : ");
		String email = scan.nextLine();
		
		try {
			Class.forName(dbType);

			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			
			String ins = "INSERT INTO userinfo VALUES (?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(ins);
			pstmt.setString(4, email);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(1, id);	
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		}
	}

}
