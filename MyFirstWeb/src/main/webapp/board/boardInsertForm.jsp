<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
세션 갑 ㅅ: ${sessionScope.s_id }<br/>
    <c:if test="${sessionScope.s_id eq null }">
    <% response.sendRedirect("http://localhost:8181/MyFirstWeb/"); %>
    </c:if> <!-- 이렇게 세션을 발급해서 하면 f12로 readonly 지워버리고 뚫을수있기때문에 csrf 토큰이란걸 사용해 방어 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/MyFirstWeb/boardInsert.do" method="post">
	글제목 : <input type="text" name="title"/> 
	글쓴이 : <input type="text" name="writer" value="${sessionScope.s_id }" readonly/><br/>
	본문 : <textarea cols="50" rows="15" name="content"/></textarea> <br/>
	<hr/>
	<input type="submit" value="글쓰기"/> 
	<input type="reset" value="초기화">
	</form>
</body>
</html>