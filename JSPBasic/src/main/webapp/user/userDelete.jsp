<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인했는지 여부 확인(세션)
		String sId = (String)session.getAttribute("s_id");
	// 로그인 안했다면 redirect로 로그인창으로 보내기
		if(sId == null){
		response.sendRedirect("userLoginForm.jsp");
	}	
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "mysql";
		
		ResultSet rs = null;
		try {
			
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			String del = "DELETE FROM userinfo WHERE user_id=?";;
			PreparedStatement pstmt = con.prepareStatement(del);
			pstmt.setString(1, sId);
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
	// 로그인 된 유저라면 해당 유저의 세션에 있던 아이디를 이용해 회원탈퇴 로직 실행
	// 한 다음 발급되어있던세션 파기(로그아웃) 까지 시킨 다음
		session.invalidate();
	// 다시 로그인창으로 보내기
		response.sendRedirect("userLoginForm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>