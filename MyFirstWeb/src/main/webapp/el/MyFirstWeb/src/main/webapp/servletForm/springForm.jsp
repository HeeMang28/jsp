<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- http://localhost:8181/MyFirstWeb/spring 을 목적지로 하는 폼을 만들어주세요.
	종전처럼 jsp, boot라는 이름으로 submit을 하는 폼을 생성해주세요.-->
	<form action="http://localhost:8181/MyFirstWeb/spring">
		<input type="text" name="jsp"/><br/>
		<input type="text" name="boot"/><br/>
		<input type="text" name="jpa"/><br/>
		<input type="submit" value="제출하기">
	</form>
</body>
</html>