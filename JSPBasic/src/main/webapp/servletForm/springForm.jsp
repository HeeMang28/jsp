<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  http://localhost:8181/JSPBasic/spring을 목적지로 하는 폼을 만들어주세요. 
	좀전처럼 jsp, boot 라는 이름으로 submit을 하는 폼을 생성해주세요. -->
	<form action="http://localhost:8181/JSPBasic/spring" method="post">
		jsp 파라미터 값 : <input type="text" name="jsp" /><br/>
		boot 파라미터 값 : <input type="text" name="boot" /> <br/>
		<input type="submit" value="확인"> <br/>
	</form>
</body>
</html>