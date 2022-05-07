<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// userLoginCheck.jsp에서 발급한 세션을 저장해주세요.
	String sId = (String)session.getAttribute("s_id");
	
	// 조회해서 null이면 userLoginForm.jsp으로 보내버리고
	if(sId == null){
		response.sendRedirect("userLoginForm.jsp");
	}
	
	// 아이디가 존재한다면 body태그 내에 XXX님 환영합니다!!
	
	// 라는 문장과 아래쪽에 userLogout.jsp로 가는 링크와 함께
	// "로그아웃" 이라는 문장을 a태그를 이용해 띄워주세요.


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= sId %>님 환영합니다!!</h1>
	<a href="userLogout.jsp">로그아웃</a>
	<a href="userDelete.jsp">회원탈퇴</a>
	<a href="userUpdateForm.jsp">정보수정</a>
</body>
</html>