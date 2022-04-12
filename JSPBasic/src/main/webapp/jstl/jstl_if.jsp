<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 페이지 내부에서 c태그라이브러리를 써서 태그화 하고싶다면 디렉티브를 이용해 선언해줍니다. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  name이 홍길동으로 들어오는 경우만 화면에 "name 파라미터로 들어온 값은 홍길동 입니다. "라고 출력 -->
	<c:if test="${param.name eq '홍길동' }">
		<c:out value="name파라미터에 들어온 값은 홍길동입니다." />
	</c:if>
	<c:if test="${param.name eq '이순신' }">
		<c:out value="이순신입니다."/>
	</c:if>
	
	<!--  변수를 선언하는데 스크립트릿 대신 c:set을 이용해보겠습니다. -->
	<c:set var="fName" value="${ param.name}" />
	<c:out value="당신이 입력한 값은 ${fName}입니다." /><br/>
	당신이 입력한 값은 ${fName }입니다.<br/>
	<c:set var="fNationality" value="${param.nationality}" /><br/>
	<c:out value="${fName }의 국적은 ${fNationality }입니다." /><br/>
</body>
</html>