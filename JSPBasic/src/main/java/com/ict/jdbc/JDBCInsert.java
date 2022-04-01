package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCInsert {

	public static void main(String[] args) {
		// 0. Scanner로 id, pw, name, email을 입력받아
		// INSERT INTO 구문을 이용해 DB에 데이터를 적재하도록 해보겠습니다.
		
		// SELECT Q1처럼 작성해주시되(입력받기, DB연결, 쿼리문 실행 등...)
		// SELECT 구문을 제외한 나머지 INSERT, DELETE, UPDATE 구문은
		// 조회목적으로 날리는 데이터가 없기 때문에 ResultSet을 필요로 하지 않습니다.
		// 실행이 된 다음 MySQL Workbench를 켜서 데이터 입력 여부만 확인해주시거나
		// 혹은 SELECTQ1에 입력한 아이디를 넣어 확인해주시면 됩니다.
		
		// 쿼리문 실행시 SELECT 구문은 executeQuery("쿼리문"); 을 호출했지만
		// SELECT가 아닌 구문은 executeUpdate("쿼리문"); 을 대신 호출하며
		// ResultSet을 좌변에 적지 않아도 됩니다.
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
			// 1. JDBC 연동
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														"root", 
														"mysql");
			Statement stmt = con.createStatement();
			// String sql = "INSERT INTO userinfo VALUES ('" + id + "', '" + pw + "', '" + name + "', '" + email + "')";
			stmt.executeUpdate("INSERT INTO userinfo VALUES ('"+ id +"' , '" + pw + "' , '" + name +"' , '" + email + "')");
	}	catch(Exception e) {
		e.printStackTrace();
		}	finally {
			scan.close();
		}
	}
}
