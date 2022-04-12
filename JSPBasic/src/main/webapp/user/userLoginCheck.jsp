<%@page import="com.ict.domain.UserDAO"%>
<%@page import="com.ict.domain.UserVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("Id");
	String userPw = request.getParameter("Pw");
	
	// 추후 DB에서 꺼낸 아이디와 패스워드를 저장할 변수
	String dbId = null;
	String dbPw = null;
	// DAO를 이용한 로그인 로직으로 수정해주세요.
	UserDAO dao = UserDAO.getInstance();
	UserVO user = dao.getUserInfo(userId);
	dbId = user.getUserId(); // 해당아이디가 DB에 없을경우 null이 저장됨
	dbPw = user.getUserPw();
	if(dbId != null){
		if(userPw.equals(dbPw)){
			session.setAttribute("s_id", dbId);
			response.sendRedirect("loginWelcome.jsp");
		} else {
			response.sendRedirect("userPwFail");
	} 	
	} else {
		response.sendRedirect("userIdFail.jsp");
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