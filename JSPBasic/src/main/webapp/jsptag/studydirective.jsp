<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Date date = new Date();
%>
	현재 시간 정보 : <%= date.getHours() %>시 <%=date.getMinutes() %>분 <%=date.getSeconds() %>초
</body>
</html>