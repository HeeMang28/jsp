<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String protocol = request.getProtocol();
	String conPath = request.getContextPath();
	StringBuffer url = request.getRequestURL();
	String uri = request.getRequestURI();
	int serverPort = request.getServerPort();
	String method = request.getMethod();
	String addr = request.getRemoteAddr();
	String sName = request.getServerName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	요청 프로토콜 : <%= protocol %><br/>
	요청 컨텍스트 경로 : <%= conPath %><br/>
	요청 URL : <%= url %><br/>
	요청 URI : <%= uri %><br/>
	서버 포트 : <%= serverPort %><br/>
	요청 메서드 : <%= method %><br/>
	요청 ip 주소 : <%= addr %><br/>
	요청 서버 이름 : <%= sName %><br/>
</body>
</html>