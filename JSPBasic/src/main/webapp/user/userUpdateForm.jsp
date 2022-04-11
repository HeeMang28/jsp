<%@page import="com.ict.domain.UserVO"%>
<%@page import="com.ict.domain.UserDAO"%>
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
	
	UserDAO dao = new UserDAO();
	UserVO user = dao.getUserInfo(userId);
	
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
		이름 : <input type="text" name="fName" value="<%=user.getUserName() %>" readonly /> <br/>
		이메일 : <input type="text" name="fEmail" value="<%=user.getEmail() %>"/> <br/> <!--  value를 사용하면 디폴트값으로 저장해줍니다. -->
		<input type="submit" value="수정하기">
	</form>
</body>
</html>