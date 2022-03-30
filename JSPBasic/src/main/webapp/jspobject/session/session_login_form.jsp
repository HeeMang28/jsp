<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 이미 로그인한 사람이 로그인 페이지를 들어올 수도 없게 해야 합니다.
	// 로그인한 사람이 들어오는 경우, session_login_ok.jsp로 보내주세요.
	String userId = (String)session.getAttribute("s_id");

	if(userId != null){
		// userId에 뭔가 값이 들어있다면 그건 로그인할때 썻던 아이디이므로, null이 아닌 사용자를 로그인완료창으로 보내야함
		response.sendRedirect("session_login_ok.jsp");
	}

%>
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