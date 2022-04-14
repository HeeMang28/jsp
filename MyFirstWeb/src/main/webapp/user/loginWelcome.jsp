<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
	String userId = (String)session.getAttribute("s_id");

	if(userId == null){
		response.sendRedirect("userLoginForm.jsp");
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= userId %>님 로그인을 환영합니다!</h1>
	<a href="userLogout.jsp">로그아웃하기</a>
	<a href="userDelete.jsp">회원탈퇴</a>
	<a href="userUpdateForm.jsp">정보수정</a>
</body>
</html>