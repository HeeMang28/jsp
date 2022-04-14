<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	// String name = request.getParameter("name");
	//String nick = request.getParameter("nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 이름 : <%= name %>
	별명 : <%= nick %> --%>
	<hr/>
	<%-- request.getParameter("이름");
	el 내부에서는 $(param.명칭} --%>
	${param.name}<br/>
	${param.nick}<br/>
</body>
</html>