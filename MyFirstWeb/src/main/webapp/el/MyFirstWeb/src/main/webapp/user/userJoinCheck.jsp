1<%@page import="kr.co.ict.domain.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//userJoinCheck.jsp 를 만들어서
//userJoinForm.jsp에서 보낸 정보를 변수로 저장해주세요.
	// 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	String formId = request.getParameter("fId");
	String formPw = request.getParameter("fPw");
	String formName = request.getParameter("fName");
	String formEmail = request.getParameter("fEmail");

	// 회원가입을 처리하는 로직을 작성해주세요.
	// 쿼리문은 INSERT INTO userinfo VALUES 
	// 				(아이디, 비번, 이름, 이메일);
	// DB와 연동해서 formId에 해당하는 유저 전체 정보를 받아줍니다.(getUserInfo.jsp로직을 참조)
	
	// 1. DAO생성
	UserDAO dao = UserDAO.getInstance();
	// 2. userJoinCheck 메서드 호출 후 진입점(userJoinCheck.jsp)
	//    전달 fId=abcd, fPw=1234, fName=알파, email=alpha@alpha.com
	//    위 정보를 토대로 .userJoinCheck()를 실행하는 로직의 순서를 적어주세요.
	dao.userJoinCheck(formId, formPw, formName, formEmail);
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
<%
/*
String dbType = "com.mysql.cj.jdbc.Driver";
String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
String connectId = "root";
String connectPw = "mysql";

ResultSet rs = null;
try {
	Class.forName(dbType);

	Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
	// 3. 해당 아이디의 정보만 ResultSet에 받아와서
	// 쿼리문은 SELECT * FROM userinfo WHERE user_id = 유저아이디;
	String sql = "INSERT INTO userinfo VALUES(?, ?, ?, ?);";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, formId);
	pstmt.setString(2, formPw);
	pstmt.setString(3, formName);
	pstmt.setString(4, formEmail);
	
	
	pstmt.executeUpdate();// formId에 해당하는 계정정보(아이디, 패스워드, 이메일, 이름)
} catch(Exception e){
	e.printStackTrace();
}
*/
%>