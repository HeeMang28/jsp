<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String joinId = request.getParameter("id");
	String joinPw = request.getParameter("pw");
	String joinName = request.getParameter("name");
	String joinEmail = request.getParameter("email");
	
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql";
	
	ResultSet rs = null;
try {
		
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		String sel = "INSERT INTO userinfo VALUES (?, ?, ?, ?);";
		PreparedStatement pstmt = con.prepareStatement(sel);
		pstmt.setString(1, joinId);
		pstmt.setString(2, joinPw);
		pstmt.setString(3, joinName);
		pstmt.setString(4, joinEmail);
		pstmt.executeUpdate();
	} catch(Exception e){
		e.printStackTrace();
	}
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