<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  c:choose를 이용해서 "자바"가 들어온 경우
	"스프링부트로 배민에서 웹 개발을 합니다."
	"파이썬" 을 들어오는 경우 " 장고로 요기요에서 웹 개발을 합니다."
	otherwise는 "php로 웹개발합니다. " 가 출력되도록 아래에 코드를 작성해 보내주세요.
	 -->
	 <c:choose>
	 <c:when test="${param.lang eq '자바' }"> 
	 <c:out value="스프링부트로 배민에서 웹개발을 합니다." />
	 </c:when>
	 <c:when test="${param.lang eq '파이썬' }"> 
	 장고로 요기요에서 웹 개발을 합니다.
	 </c:when>
	 <c:otherwise>
	 php로 웹개발을 합니다.
	 </c:otherwise>
	 </c:choose>
</body>
</html>