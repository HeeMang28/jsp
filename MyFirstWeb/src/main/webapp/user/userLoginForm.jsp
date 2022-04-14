<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("s_id");

	if(userId != null){
	response.sendRedirect("loginWelcome.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="userLoginCheck.jsp" method="post">
		ID : <input type="text" name="Id"><br/>
		비밀번호 : <input type="password" name="Pw"><br/>
		<input type="submit" value="로그인">
	</form>
	<a href="userJoinForm.jsp"> 회원가입 </a>
</body>
</html>