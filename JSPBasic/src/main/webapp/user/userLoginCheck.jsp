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
	
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql";
	
	ResultSet rs = null;
	
	UserVO user = new UserVO();
	try {
		
		Class.forName(dbType);

		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		String sel = "SELECT * FROM userinfo WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sel);
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
		if(rs.next()){
		// 생성된 UserVO에 Setter를 이용해 변수명에 맞는 자료 입력
		user.setUserId(rs.getString(1));
		user.setUserPw(rs.getString(2));
		user.setUserName(rs.getString(3));
		user.setEmail(rs.getString(4));
		} else {
			response.sendRedirect("userIdFail.jsp");
		}
		rs.close(); // ResultSet, Connection, PrepareStatement는 .close()로 닫을수있음.
	} catch(Exception e){
		e.printStackTrace();
	}
	// DB에 들어있던 id와 userId를 비교하고, DB에 들어있던 pw와 formPw를 비교해서
	// 적절한 처리를 해주세요.
		// dbId = rs.getString(1);
		//dbPw = rs.getString(2);
		//if(userPw.equals(dbPw)){
		//	session.setAttribute("s_id", userId);
		//	response.sendRedirect("http://localhost:8181/JSPBasic/user/loginWelcome.jsp");
		//}
		//}
	//} else {
		// rs.next() 가 false라는것은 DB에 해당 아이디가 존재하지 않는것이므로 아이디 없음 페이지
	//	response.sendRedirect("http://localhost:8181/JSPBasic/user/userIdFail.jsp");
	//}
	// >if(rs.next()){
	//	out.println("아이디 : " + rs.getString(1) + "<br/>");
	//	out.println("비밀번호 : " + rs.getString(2) + "<br/>");
	//	out.println("이름 : " + rs.getString(3) + "<br/>");
	//	out.println("이메일 : " + rs.getString(4) + "<br/>");
	//} else {
	//	out.println("<h1>아이디가 없습니다!</h1>");
	// } 
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