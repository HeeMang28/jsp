<%@page import="com.ict.domain.UserVO"%>
<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	// 1. userId 라는 이름으로 전달되는 데이터를 받으면(request.getParameter)
	String userId = request.getParameter("userId"); // request 뒤에있는 userId는 http 변수이다
	// 2. DB연동 후
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "mysql";
		
		ResultSet rs = null;
		try {
			
			Class.forName(dbType);

			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			String sel = "SELECT * FROM userinfo WHERE user_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sel);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
		} catch(Exception e){
			e.printStackTrace();
		}
*/	
	// 1. userId 라는 이름으로 전달되는 데이터를 받으면 (request.get?????)
	String userId = request.getParameter("userId");
	// - DAO 생성(MySQL을 쓴다고 지정)
	UserDAO dao = new UserDAO();
	// - DAO 내부 메서드인 .getUserInfo(유저명) 호출
	UserVO user = dao.getUserInfo(userId);
	//out.println(user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--   유저 정보를 여기에 작성해주세요. -->
	아이디 : <%= user.getUserId() %><br/>
	비밀번호 : <%= user.getUserPw() %><br/>
	이름 : <%= user.getUserName() %><br/>
	이메일 : <%= user.getEmail() %><br/>

</body>
</html>