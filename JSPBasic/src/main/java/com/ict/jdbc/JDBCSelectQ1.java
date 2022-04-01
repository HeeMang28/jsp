package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCSelectQ1 {
	
	public static void main(String[] args) {
		//Scanner scan = new Scanner(System.in);
		//System.out.print("조회할 아이디를 입력해주세요 : ");
		//String userId = scan.nextLine();
		Scanner scan = new Scanner(System.in);
		String userId = scan.nextLine();
		try {
			// 1. JDBC 연동
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														"root", 
														"mysql");
			// 2. Statement 구문 생성
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM userinfo WHERE user_id = '"+ userId +"'";
			System.out.println("실행 예정 구문 : " + sql); //코드가 잘실행되는지 확인하는 코드
			 // 3. 쿼리문 실행
			ResultSet rs = stmt.executeQuery(sql);
			// 4. rs받아와서 출력
			if (rs.next()) {
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				System.out.println(rs.getString(4));
				System.out.println("---------------");
			} else {
				System.out.println(userId + "는 DB에 없는 데이터입니다.");
			}
			/* public static void main(String[] args) {
				Scanner scan = new Scanner(System.in);
				System.out.print("조회할 아이디를 입력해주세요 : ");
				String userId = scan.nextLine();
				try {
					Class.forName("com.mysql.cj.jdbc.Driver"); 
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
																"root", 
																"mysql"); 
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM userinfo WHERE user_id ='"+ userId +"'");
					rs.next();
					System.out.println(rs.getString(1));
					System.out.println(rs.getString(2));
					System.out.println(rs.getString(3));
					System.out.println(rs.getString(4));
			} 	catch(Exception e) {
				e.printStackTrace();
				}
			}
		} */
	} 	catch(Exception e) {
		e.printStackTrace();
		}
	}
}