<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("id");
	String userPw = request.getParameter("pw");
	
	if(userId.equals("abc1234")){
		// 비밀번호가 맞는경우와 틀린경우
		// 를 나눠서 성공시 세션을 발급하고
		if(userPw.equals("1111")){
			// 세션 발급 후 session_login_ok.jsp로 보내주세요.
			// 세션명은 "s_id" 세션값은 로그인한 아이디
			session.setAttribute("s_id", userId);
			response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/session/session_login_ok.jsp");
		} else {
			// session_pw_fail.jsp로 보내주세요.
		response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/session/session_pw_fail.jsp");
	} 
	} 	else { 
		// session_id_fail.jsp로 보내주세요.
		response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/session/session_id_fail.jsp");
	}
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