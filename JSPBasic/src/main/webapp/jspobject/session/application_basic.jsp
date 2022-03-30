<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int visitCnt = 0;
	// getAttribute는 값이 없으면 null 로 반환
	Integer temp = (Integer)application.getAttribute("visit");
	if(temp != null){
		visitCnt = temp;
	}
	visitCnt++;
	
	application.setAttribute("visit", visitCnt);
%>
<hr/>
	<h3>방문자수 : <%= visitCnt %></h3>
<hr/>	
