<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userId = (String)session.getAttribute("id_session");
	String userName = (String)session.getAttribute("name_session");

	out.println("세션에 저장된 값 : " + userId + "<br/>");
	out.println("세션에 저장된 값 : " + userName + "<br/>");
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