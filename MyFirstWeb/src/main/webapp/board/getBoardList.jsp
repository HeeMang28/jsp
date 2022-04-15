<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/boardList 임시 페이지 을 적어주세요.</h1>
	<table class="table">
		<thead>
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>글쓴이</td>
				<td>내용</td>	
				<td>쓴날짜</td>
				<td>수정날짜</td>
				<td>조회수</td>
				<td></td>
			</tr>
		</thead>
		<!--  JSTL c:forEach와 ${boardList}를 활용하면 됩니다.
		전체 글 정보를 테이블 형식으로 보여주세요. -->
		<tbody>
			<c:forEach var="board" items="${boardList }">
			<tr>
				<td>${board.boardNum }</td>
				<td>${board.title }</td>
				<td>${board.content }</td>
				<td>${board.writer }</td>
				<td>${board.bDate }</td>
				<td>${board.mDate }</td>
				<td>${board.hit }</td>
			</tr>
			</c:forEach>
		</tbody>	
	</table>
</body>
</html>