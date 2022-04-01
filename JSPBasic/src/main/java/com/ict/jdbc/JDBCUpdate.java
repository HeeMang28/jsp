package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCUpdate {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("수정할 아이디를 입력해주세요.");
		String id = scan.nextLine();
		System.out.println("새로운 비번을 입력해주세요.");
		String pw = scan.nextLine();
		System.out.println("새로운 이름을 입력해주세요.");
		String name = scan.nextLine();
		System.out.println("새로운 이메일을 입력해주세요.");
		String email = scan.nextLine();
		// 스캐너를 이용해서
		// 수정할 아이디, 해당아이디에 대한 새로운 비번, 새로운 이름, 새로운 이메일을 입력받아주시면 됩니다.
		try {
			// 1. JDBC 연동
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														"root", 
														"mysql");
			Statement stmt = con.createStatement();
		// DB연동 후 쿼리문을 날려서 수정로직을 돌려주신 다음
			//String sql = "UPDATE userinfo SET user_pw= '"+ pw + "', user_name= '" + name + "' , email= '" + email + "' WHERE user_id = '" + id + "'";
			//System.out.println(sql);
			//stmt.executeUpdate
			stmt.executeUpdate("UPDATE userinfo SET user_pw= '"+ pw + "', user_name= '" + name + "' , email= '" + email + "' WHERE user_id = '" + id + "'");
		// workbench를 이용해 수정된 내역이 반영되었는지 확인해주세요.

	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		scan.close();
	}

	}

}
