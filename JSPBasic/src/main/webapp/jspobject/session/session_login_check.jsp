<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("abc1234")){
		if(pw.equals("1111")){
			session.setAttribute("session_id", "abc1234");
			out.println("로그인에 성공했습니다.");
		} else {
		response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/session/session_login_form.jsp");
	} 
	} 	else { 
		response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/session/session_login_form.jsp");
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