<%@page import="kr.co.ict.domain.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.ict.domain.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아래쪽에 원래 작성된 접속 로직 저장되어있음.
	//UserDAO dao = new UserDAO();// 생성과 동시에 Class.forName(디비타입) 까지 호출
	UserDAO dao = UserDAO.getInstance();//싱글턴에 의해 static영역 변수 주소만 받아옴
	List<UserVO> userList = dao.getAllUserList();// DB연결해 전체 목록 가져다 주고 종료.
	out.println("DAO에서 전달받은 자료들 : " + userList);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>유저아이디</th>
				<th>유저비번</th>
				<th>유저이름</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<% for(UserVO user : userList){ %>
				<tr>
					<td><%= user.getUserId() %></td>
					<td><%= user.getUserPw() %></td>
					<td><%= user.getUserName() %></td>
					<td><%= user.getEmail() %></td>
				</tr>		
			<% } %>
		</tbody>
	</table>
</body>
</html>








<%
/*
// 스크립트릿 내부에 전체 회원정보를 가져오도록 코드를 작성해서
// ResultSet 변수에 저장까지만 해 주세요.
String dbType = "com.mysql.cj.jdbc.Driver";
String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
String connectId = "root";
String connectPw = "mysql";

// try블럭이 닫히는 순간, 내부에서 최초로 선언된 변수들도 다 사라짐
// 그래서 body태그에 출력해야하는 필수요소는 try 진입 전 선언해놔야함
ResultSet rs = null;

try {
	Class.forName(dbType);

	Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);

	String sql = "SELECT * FROM userinfo";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
				
	rs = pstmt.executeQuery();
} catch(Exception e){
	e.printStackTrace();
}
*/
%>