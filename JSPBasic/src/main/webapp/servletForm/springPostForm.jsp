<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/JSPBasic/spring" method="post">
		jsp 파라미터 값 : <input type="text" name="jsp" /><br/>
		boot 파라미터 값 : <input type="text" name="boot" /> <br/>
		jpa 파라미터 값 : <input type="text" name="jpa" /> <br/>
		<input type="submit" value="확인"> <br/>
	</form>
</body>
</html>