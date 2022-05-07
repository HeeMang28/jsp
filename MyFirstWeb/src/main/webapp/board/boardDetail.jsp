<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${board} <br/>
	<h1>${board.boardNum }번 글 조회중입니다. </h1><br/> 
	제목 : <input type="text" value="${board.title }">  조회수 : ${board.hit }<br/>
	본문 : <textarea cols="40" rows="10">${board.content } </textarea> <!--  텍스트는 괄호 밖에다가 el로 처리 -->
	글쓴이 : <input type="text" value="${board.writer }"><br/>
	쓴날짜 : ${board.bDate } <br/>
	마지막 수정날짜 : ${board.mDate }<br/>
	<hr/>
	<a href="http://localhost:8181/MyFirstWeb/boardList.do"><buttion>목록으로</buttion></a>
	<!--  삭제번호를 서블릿 boardDelete로 보내야함 -->
	<c:if test="${sessionScope.s_id eq board.writer }">
	<form action="http://localhost:8181/MyFirstWeb/boardDelete.do" method="post">
	<!--  삭제용 글 번호는 노출시킬 필요가 없으므로 hidden타입으로 숨겨서 보냄 -->
	<input type="hidden" name="board_num" value="${board.boardNum }"><br/>
	<input type="hidden" name="board_writer" value="${board.writer }"><br/>
	<input type="submit" value="삭제하기" />
	</form>
	<form action="http://localhost:8181/MyFirstWeb/boardUpdateForm.do" method="post">
	<input type="hidden" name="board_num" value="${board.boardNum }"><br/>
	<input type="submit" value="수정하기">
	</form>
	</c:if>
</body>
</html>