<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 반복해서 출력하려면 JSTL을 활용하는것이 일반적임 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/boardList 로 연결된 임시페이지입니다.</h1>
	<table border="1">
		<thead>
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>글쓴이</td>
				<td>쓴날짜</td>
				<td>수정날짜</td>
				<td>조회수</td>
			</tr>
		</thead>
			<!-- JSTL c:forEach와 ${boardList}를 활용하면 됩니다.
			전체 글 정보를 테이블 형식으로 보여주세요. getAllBoardList.jsp 참고해주세요.-->
			<tbody>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.boardNum}</td>
						<td>${board.title}</td>
						<td>${board.writer}</td>
						<td>${board.bDate}</td>
						<td>${board.mDate}</td>
						<td>${board.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
	</table>	
</body>
</html>