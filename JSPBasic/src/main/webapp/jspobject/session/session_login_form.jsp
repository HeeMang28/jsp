<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/JSPBasic/jspobject/session/session_login_check.jsp" method="post">
		ID : <input type="text" name="id" placeholder="아이디"/><br/>
		비밀번호 : <input type="password" name="pw" placeholder="비밀번호" /><br/>
		<input type="submit" value="확인">
	</form>
</body>
</html>