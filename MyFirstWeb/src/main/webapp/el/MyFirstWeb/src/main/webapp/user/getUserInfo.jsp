<%@page import="kr.co.ict.domain.UserVO"%>
<%@page import="kr.co.ict.domain.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. userId 라는 이름으로 전달되는 데이터를 받으면(request.get?????)
	String userId = request.getParameter("userId");
	
	// - DAO생성(MySQL을 쓴다고 지정)
	UserDAO dao = UserDAO.getInstance();
	// - DAO 내부 메서드인 .getUserInfo(유저명) 호출
	UserVO user = dao.getUserInfo(userId);
	System.out.println("유저 정보 확인 : " + user);
	out.println(user + "<br/>");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 유저 정보를 여기에 작성해주세요. -->
	아이디 : <%= user.getUserId() %>	<br/>
	비밀번호 : <%= user.getUserPw() %>	<br/>
	이름 : <%= user.getUserName() %>	<br/>
	이메일 : <%= user.getEmail() %>	<br/>

</body>
</html>
<%
/*
// ResultSet 변수에 저장까지만 해 주세요.
String dbType = "com.mysql.cj.jdbc.Driver";
String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
String connectId = "root";
String connectPw = "mysql";
// try블럭이 닫히는 순간, 내부에서 최초로 선언된 변수들도 다 사라짐
// 그래서 body태그에 출력해야하는 필수요소는 try 진입 전 선언해놔야함
ResultSet rs = null;
// 2. DB연동 후
try {
	Class.forName(dbType);

	Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
	// 3. 해당 아이디의 정보만 ResultSet에 받아와서
	// 쿼리문은 SELECT * FROM userinfo WHERE user_id = 유저아이디;
	String sql = "SELECT * FROM userinfo WHERE user_id = ?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	//?를 채워주세요.
	pstmt.setString(1, userId);
	rs = pstmt.executeQuery();
} catch(Exception e){
	e.printStackTrace();
}
*/
%>



