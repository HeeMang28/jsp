<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!

 int total = 0;
%>
<%
	int each = 0;
	each++;
	total++;
	%>
</body>
<h1>스크립트릿과 선언부의 차이</h1>
	total = <%= total %><br/>
	each = <%= each %><br/>
</html>