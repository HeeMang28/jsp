package com.ict.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

// DAO 클래스 DB연동시 반복적으로 작성하는 코드를 중복 작성하지 않기 위해 작성합니다.
public class UserDAO {
	// DB접속시 필요한 변수들을 아래에 선언합니다.
	private String dbType = "com.mysql.cj.jdbc.Driver";
	private String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	private String connectId = "root";
	private String connectPw = "mysql";

	// 생성자를 이용해 생성할 때 자동으로 Class.forName()을 세팅하게 만들어줍니다.
	// 어떤 쿼리문을 실행하더라도 위의 DB접속 변수의 DB종류지정은 무조건 하기에 생성자로 생성합니다.
	public UserDAO() {
		try {
			Class.forName(dbType);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// getAllUserList.jsp의 핵심 로직을 DAO로 옮겨서 작성해보겠습니다.
	// getAllUserList는 전체 유저 목록을 필요로 하기 때문에
	// userinfo테이블의 row 여러개를 받아올 수 있어야 합니다.
	public List<UserVO> getAllUserList() { // List를 붙이는이유 UserVO가 1줄의 row를 담아줄수잇는데 UserVO의 row가 여러개일수잇기때문에 list를 붙여준다.
		// .jsp에서 로드할때는 페이지가 옮겨가면 어차피 다 삭제되었기 때문에 .close()를
		// 해 줘도 안 해줘도 큰 상관이 없었습니다.
		// 그러나 DAO에서는 회수를 안 해주면 힙에 데이터가 계속 쌓여 시스템에 부하가 생깁니다.
		// 그래서 꼬박꼬박 접속이 끝나면 .close()를 해줘야 합니다.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // ResultSet은 실행쿼리문이 SELECT 구문인 경우 결과값을 받기 위해 필요합니다.
		// 결과로 DB에서 꺼내올 user들의 목록도 미리 선언해둡니다.
		List<UserVO> userList = new ArrayList<>();
		
		// 필요한 모든 변수가 선언되었다면 try 블럭을 선언합니다.
		try {
			// getAllUserList.jsp를 참조해 아래 로직을 작성해주세요.
			// Connection 생성
			con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			
			// 쿼리문 저장
			String sql = "SELECT * FROM userinfo";
			// PrepareStatement에 쿼리문 입력
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 유저 한 명의 정보를 담을 수 있는 VO 생성
				UserVO user = new UserVO();
				// 디버깅으로 비어있는것 확인
				System.out.println("집어넣기 전 : " + user);
				// setter로 다 집어넣기
				user.setUserId(rs.getString(1));
				user.setUserPw(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setEmail(rs.getString(4));
				// 다 집어넣은 후 디버깅
				System.out.println("집어넣은 후 : " + user);
				// userList에 쌓기
				userList.add(user);
			}
			System.out.println("리스트에 쌓인 자료 체크 : " + userList);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return userList;
	} // getAllUserList() 끝나는 지점.
	
	// 쿼리문 내에 ? 가 있다면
	// ? 개수만큼 사용자가 입력해야 하게 합니다.
	// 그래서 메서드에 요청 파라미터로
	// ?개수만큼 선언해줍니다.
	public UserVO getUserInfo(String userId) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		UserVO user = new UserVO();
		try {
		
			con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			String sel = "SELECT * FROM userinfo WHERE user_id = ?";
			pstmt = con.prepareStatement(sel);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			// rs내부 데이터를 user변수에 옮겨넣어주세요 (setter 사용)
			if(rs.next()) {
				user.setUserId(rs.getString(1));
				user.setUserPw(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setEmail(rs.getString(4));
			}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			con.close();
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	} 
		return user;
	}
//getUserInfo() 끝나는 지점

} // UserVO가 끝나는 지점
