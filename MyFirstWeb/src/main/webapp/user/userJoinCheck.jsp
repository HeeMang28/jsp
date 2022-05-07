<%@page import="kr.co.ict.domain.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String joinId = request.getParameter("id");
	String joinPw = request.getParameter("pw");
	String joinName = request.getParameter("name");
	String joinEmail = request.getParameter("email");
	System.out.println(joinId);
	System.out.println(joinPw);
	System.out.println(joinName);
	System.out.println(joinEmail);
	// 회원가입을 처리하는 로직을 작성해주세요.
	// 쿼리문은 INSERT userinfo VALUES;
	//				(아이디, 비번, 이름, 이메일);
	// DB와 연동해서 formId에 해당하는 유저 전체 정보를 받아줍니다. (getUserInfo.jsp로직을 참조)
	
	// 1. DAO 생성
	UserDAO dao = UserDAO.getInstance();
	// 2. userJoinCheck 메서드 호출 후 진입점(userJoinCheck.jsp)
	dao.userJoinCheck(joinId, joinPw, joinName, joinEmail);
	response.sendRedirect("userLoginForm.jsp");
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