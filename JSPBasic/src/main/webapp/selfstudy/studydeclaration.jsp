<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! 
	public int a = 7;
	int minus(int m1, int m2){
		return m1 - m2;
		}%>
	<%
	int result = minus(10, 7);
			out.println("10 - 7 = " + result + " <br/>");
		out.println("103 + 70 = " + minus(103, 70) + "<br/>");
		out.println(result);%>
</body>
</html>