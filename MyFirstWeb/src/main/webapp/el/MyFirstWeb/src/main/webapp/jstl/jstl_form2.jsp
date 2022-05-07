<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jstl_choose.jsp로 목적지를 잡고
	사용 언어를 입력할 수 있는 input태그를 이용해 lang을 넘기면 됩니다. 
	post방식으로 보냅니다.-->
	<form action="jstl_choose.jsp" method="post">
		사용 언어 : <input type="text" name="lang"><br/>
		<input type="submit" value="제출">
	</form>
	
	
</body>
</html>