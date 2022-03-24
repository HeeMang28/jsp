<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<Integer> lotto = new ArrayList<>();
	while(true){
		int rn = (int)(Math.random() * 45) +1;
		//contains() : 리스트 내부에 해당 객체가 존재하면 true를 리턴.
		if(!lotto.contains(rn)) {
			lotto.add(rn);
		}
		if(lotto.size() == 6){
			break;
		}
	}
	// 리스트 오름차 정렬방법.
	Collections.sort(lotto);
%>
	<h1> 로또번호 생성 결과 </h1>
	<p> 이번주 로또는 이 번호다! </p>
	<%
		for(Integer num : lotto){
			out.println(num + "&nbsp;");
			Thread.sleep(700); // CPU를 잠시 멈추는 메서드
			out.flush(); // 브라우저의 출력 버퍼를  비우는 메서드
		}
	%>
</body>
</html>