<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("fId");
	String userPw = request.getParameter("fPw");
	String userName = request.getParameter("fName");
	String userEmail = request.getParameter("fEmail");
	
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql";
	
	ResultSet rs = null;
	try {
		
		Class.forName(dbType);

		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		String up = "UPDATE userinfo SET user_pw= ? , user_name=?, email=? WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(up);
		pstmt.setString(1, userPw);
		pstmt.setString(2, userName);
		pstmt.setString(3, userEmail);
		pstmt.setString(4, userId);
		pstmt.executeUpdate();
	} catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("loginWelcome.jsp");
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