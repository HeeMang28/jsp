<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/JSPBasic/user/getUserInfo.jsp" method="post">
	user_id : <input type="text" name="userId" /><br/>
	user_pw : <input type="password" name="userPw"/><br/>
	<input type="submit" placeholder="로그인"/>
	</form>
</body>
</html>