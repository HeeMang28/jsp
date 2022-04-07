<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 회원 수정페이지는
	// 비번, 이름, 이메일을 수정할 수 있는 페이지입니다.
    // 이름, 이메일은 이미 내가 가입할때 썻던 정보가 채워지게 해야합니다.
    // 로그인 여부를 체크해서 로그인 안 한 사람은 메인으로 가게 해주시고
    // 로그인 한 사람은 아래 "아이디" 부분에 대신 실제아이디가 들어가게 해주세요.
    String userId =(String)session.getAttribute("s_id");
    

	if(userId == null){
		response.sendRedirect("userLoginForm.jsp");
	}
	
	// userId 유저의 정보를 ResultSet에 받아온 다음
	// value=" <%= rs.get~~~~()% >" 형식으로 입력하면
	// 해당 유저의 이름과 이메일을 사전에 미리 입력된 상태로 만들 수 있음.
	// SELECT * FROM userinfo WEHERE user_id=? 를 이용해서
	// 로그인한 유저의 정보를 받아주세요.
	
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql";
	
	ResultSet rs = null;
	try {
		
		Class.forName(dbType);

		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		String sel = "SELECT * FROM userinfo WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sel);
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
	} catch(Exception e){
		e.printStackTrace();
	}
	rs.next();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- form은 회원가입 양식과 똑같이 만들어주시면 됩니다.
		단, 아이디는 입력하지 않습니다.  -->
		<!-- 페이지 넘어가서 사용하게 될 PreparedStatement 구문을 1:1로 보내주세요 .
		"UPDATE userinfo SET user_pw= ? , user_name=?, email=? WHERE user_id = ?"; -->
	<h1><%= userId %> 님의 정보를 수정합니다.</h1>
	<form action="userUpdateCheck.jsp" method="post">
		<input type="hidden" name="fId" value="<%=userId %>" ><br/>
		비밀번호 : <input type="password" name="fPw"/> <br/>
		이름 : <input type="text" name="fName" value="<%= rs.getString(3) %>" readonly /> <br/>
		이메일 : <input type="text" name="fEmail" value="<%= rs.getString(4) %>"/> <br/> <!--  value를 사용하면 디폴트값으로 저장해줍니다. -->
		<input type="submit" value="수정하기">
	</form>
</body>
</html>