<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 현재 파일인 req_user_form.sjp에 폼 태그를 만들어보겠습니다.
	목적지는 req_user.jsp 파일입니다. post방식으로 데이터를 전달합니다.
	먼저 이름, 아이디, 비밀번호를 입력해 보낼 수 있는 input태그를 만들어 주세요.
	각 태그의 name 속성은 uname, uid, upw 입니다.
	데이터를 받아주는 req_user.jsp에서 한글이 깨지지 않도록 받아서 화면에 출력해주세요.
 --%>
 	<form action="http://localhost:8181/JSPBasic/jspobject/request/req_user.jsp" method="post"/>
 	user_name : <input type="text" name="uname" /><br/>
 	user_id : <input type="text" name="uid" /><br/>
 	user_password : <input type="password" name="upw" /><br/>
 	<hr/>
 	
 	취미 :
 	<%-- input 태그 내부에 value 값을 이용해 선택되었을때 전달된 데이터를 정할 수 있습니다. --%>
 	<input type="checkbox" name="hobby" value="요리">요리 &nbsp;
 	<input type="checkbox" name="hobby" value="노래">노래 &nbsp;
 	<input type="checkbox" name="hobby" value="운동">운동 &nbsp;
 	<input type="checkbox" name="hobby" value="게임">게임 &nbsp;
 	<input type="checkbox" name="hobby" value="영화">영화 &nbsp;
 	<hr/>
 	혈액형 : 
 	<input type="radio" name="blood" value="A"> A형 &nbsp;
 	<input type="radio" name="blood" value="B"> B형 &nbsp;
 	<input type="radio" name="blood" value="O"> O형 &nbsp;
 	<input type="radio" name="blood" value="AB"> AB형 &nbsp;
 	<hr/>
 	지역 : 
 	<select name="region">
 		<option value="서울">서울</option>
 		<option value="경기">경기</option>
 		<option value="강원">강원</option>
 		<option value="충청">충청</option>
 		<option value="전라">전라</option>
 		<option value="경상">경상</option>
 		<option value="제주">제주</option>
 	</select>
 	<input type="submit" value="전송">
 	</form>
</body>
</html>