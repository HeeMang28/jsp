<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- form을 이용해
	목적지 : cookie_login_check.jsp , 메서드 : post
	name: id, name : pw 를 submit 버튼을 통해 전달합니다.
	 --%>
	 <form action="http://localhost:8181/JSPBasic/jspobject/cookie/cookie_login_check.jsp" method="post">
	 id : <input type="text" name="id" /><br/>
	 password : <input type="password" name="pw" /><br/> 
	 <input type="submit" value="로그인" /> 
	 </form>
</body>
</html>