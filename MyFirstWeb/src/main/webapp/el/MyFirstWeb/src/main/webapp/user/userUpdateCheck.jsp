<%@page import="kr.co.ict.domain.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// userUpdateForm.jsp에서 날려주는 데이터를 받아주세요.
	// 단, 이름에 한글이 포함될 수 있으므로 utf-8로 바꾸는걸 먼저 하고 그 다음 받아주세요.
	request.setCharacterEncoding("utf-8");
	String fId = request.getParameter("fId");
	String fPw = request.getParameter("fPw");
	String fName = request.getParameter("fName");
	String fEmail = request.getParameter("fEmail");
	
	// DAO를 생성해주세요.
	UserDAO dao = UserDAO.getInstance();
	
	// 가입로직을 실행해주세요.
	dao.userUpdateCheck(fId, fPw, fName, fEmail);
	
	// 웰컴페이지로 돌아가기.
	response.sendRedirect("loginWelcome.jsp");

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

try {
	Class.forName(dbType);

	Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
	// 3. 해당 아이디의 정보만 ResultSet에 받아와서
	// 쿼리문은 SELECT * FROM userinfo WHERE user_id = 유저아이디;
	String sql = 
		"UPDATE userinfo SET user_pw=?, user_name=?, email=? WHERE user_id=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(4, fId);
	pstmt.setString(1, fPw);
	pstmt.setString(2, fName);
	pstmt.setString(3, fEmail);
	
	
	pstmt.executeUpdate();// formId에 해당하는 계정정보(아이디, 패스워드, 이메일, 이름)
} catch(Exception e){
	e.printStackTrace();
}
*/
%>