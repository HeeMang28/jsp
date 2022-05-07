<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jstl_if.jsp를 목적지로 하는 폼을 만들어서
	이름(name속성도 name)을 전달하도록 폼 코드를 작성해주세요.
	submit 버튼을 눌러서 제출합니다. 
	jstl_if.jsp에서 c:set을 이용해 변수를 저장할 때 저장할 수 있는 요소를 하나 더 추가해주세요.
	name속성은 자율입니다.
	jstl_if.jsp 에서 해당 전송 데이터를 받아서 c:set으로 저장해주신다음 해당 변수를 c:out으로 출력해주세요. -->
	<form action="jstl_if.jsp">
		이름 : <input type="text" name="name"><br/>
		나이 : <input type="number" name="age"><br/>
		<input type="submit" value="제출">
	</form>
</body>
</html>