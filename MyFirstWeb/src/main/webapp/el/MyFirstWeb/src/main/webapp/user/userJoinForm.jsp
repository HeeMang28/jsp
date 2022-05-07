<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
회원가입창은 userLoginForm.jsp 하단에

로그인버튼 아래에 a태그로

userJoinForm.jsp 로 이동하는 링크를
"회원가입하기" 로 만들어서 처리합니다.

회원가입에 필요한 정보는
아이디, 비번, 이름, 이메일 을 모두 입력하고
"가입하기" 버튼을 누르면 되도록 form만 만들어서
저한테 보내주세요.
name은 알아서 지정해주세요. 목적지는 userJoinCheck.jsp*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="userJoinCheck.jsp" method="post">
		아이디 : <input type="text" name="fId"/><br/>
		비밀번호 : <input type="password" name="fPw"/><br/>
		이름 : <input type="text" name="fName"/><br/>
		이메일 : <input type="text" name="fEmail"/><br/>
		<input type="submit" value="가입하기">
	</form>
</body>
</html>