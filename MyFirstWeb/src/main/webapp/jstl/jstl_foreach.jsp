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
<%--
	// 기존 스크립트릿 내부 반복문으로 작성하기
	// 1~100까지 더해서 결과값을
	// 1부터 100까지 총합은 ? 입니다. 라고 브라우저에 출력되도록 하는 반복문을 작성해서 보내주세요.
	int total = 0;
	
	for(int i = 1; i <= 100; i++){
		total += i;
	}
	out.println("1부터 100까지의 총합은" +total+ "입니다.");
--%>

	<!-- begin="시작값", end="끝값(포함)", step="숫자증가량", var='변수명'
	c:forEach구문은 for문을 대체합니다. -->
	<c:forEach begin="1" end="100" step="1" var="number">
		<c:set var="total" value="${total + number}" /> <!--  total = total + number; -->
	</c:forEach>
	<h1>1 ~100 까지의 총합 : ${total}</h1>
	<hr>
	<h1>구구단 9단 출력</h1>
	<c:forEach begin="1" end="9" step="1" var="nine">
		<c:set var="dan" value="${9 * nine }" />
	<h3>9 * ${nine} = ${dan}</h3>
	</c:forEach>
	<%-- <c:forEach begin="1" end="9" var="dan">
	<c:out value="4 * ${dan } = ${4 * dan } " /> <br/>
	</c: forEach> 이렇게도 가능하다 --%>
	<hr>
	<c:forEach begin="2" end="9" step="2" var="dan">
		<c:forEach begin="1" end="9" step="1" var="dan2">
			<c:out value="${dan } * ${dan2 } = ${dan * dan2 }"/> <br/>
		</c:forEach>
		<hr/>
	</c:forEach>
	<hr/>
	<h1>숫자가 아닌 요소를 반복하는 JSTL</h1>
	<%-- arr변수 내에 과일 5개 이름을 배열로 저장하는 구문 --%>
	<c:set var="arr" value='<%= new String[] {"사과", "딸기", "망고", "바나나", "포도"} %>' />
	<%-- 변수 arr내부 자료 {"사과", "딸기", "망고", "바나나", "포도"}를 순차적으로 출력해보겟습니다. --%>
	<c:forEach var="i" items="${arr }">
		<c:out value="${i }" /><br/>
	</c:forEach>
	<%
		//String[] arr = {"사과", "딸기", "망고", "바나나","포도"};
		//for(String i : arr){
		// out.println(i + "<br/>");
		//}
	%>
	<hr/>
	<!--  int 배열에 10, 20, 30, 40, 50을 넣어주시고
	c:forEach문을 이용해 화면에 출력해주세요. 변수명은 마음대로 만들어주셔도 됩니다. -->
	<c:set var="num" value='<%= new Integer[] {10, 20, 30, 40, 50} %>' />
	<c:forEach var="ber" items="${num }">
		<c:out value="${ber }" /><br/>
	</c:forEach>
</body>
</html>