<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. userId 라는 이름으로 전달되는 데이터를 받으면(request.getParameter)
	String userId = request.getParameter("userId");
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
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<% 	if(rs.next()) {  // 4. body 내부에 XX 유저의 정보입니다 라는 문장과 함께 전체 정보가 나오도록 코드를 짜주세요.%>
		<%= userId %> 유저의 정보입니다.<br/>
		<%= rs.getString(1) %><br/> 
		<%= rs.getString(2) %><br/> 
		<%= rs.getString(3) %><br/> 
		<%= rs.getString(4) %><br/> 
	<%} else { %>
	<% out.println("없는 아이디 입니다.");} %>
</body>
</html>