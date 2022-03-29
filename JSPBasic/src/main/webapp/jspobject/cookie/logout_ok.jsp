<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키는 사용자 PC에 설치해두는것이기 때문에 영시적으로 삭제하는건 불가능하고
	// 대신 유효시간을 0으로 만들어 삭제하는것처럼 처리합니다.
	// login_id 라는 이름의 쿠기가 발견되면
	// 유효시간을 0으로 만든 다음 cookie_login.jsp로 보내는 로직을 작성해주세요.
	Cookie[] cookies = request.getCookies();
	
	for(Cookie cookie : cookies){
	// 쿠키 이름이 login_id인 쿠키가 발견되면 해당 쿠키 유효기간 0초로 만들고 (*cookie.setMaxAge(유효초))
		String cookieName = cookie.getName();
		if(cookieName.equals("login_id")){
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}
	response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/cookie/cookie_login.jsp");

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