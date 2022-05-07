<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인한 유저는 loginForm을 볼 수 없도록 만들어주세요.
	String userId = (String)session.getAttribute("s_id");

	if(userId != null)
		response.sendRedirect("loginWelcome.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="userLoginCheck.jsp" method="post">
		아이디 : <input type="text" name="formId" /><br/>
		비밀번호 : <input type="password" name="formPw" /><br/>
		<input type="submit" value="로그인" />
	</form>
	<a href="userJoinForm.jsp">회원가입하기.</a>
</body>
</html>