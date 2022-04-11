<%@page import="com.ict.domain.UserDAO"%>
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
	
	UserDAO dao = new UserDAO();
	dao.userUpdateCheck(userId, userPw, userName, userEmail);
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