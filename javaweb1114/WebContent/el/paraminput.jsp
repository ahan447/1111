<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 생성</title>
</head>
<body>
	<a href='paramoutput.jsp?name=양재&age=28'>
	파라미터를 직접 입력해서 생성</a>
	
	<form action='paramoutput.jsp' method='get'>
		<input name="name"
			placeholder ='이름 입력' /><br/>
		<input name="age"
			placeholder ='나이 입력' /><br/>
		<input type='submit'
			value='전송' /><br/>
			</form>
	<%
	//쿠키를 생성해서 저장
	//쿠키는 인코딩이 되어야 함
	String address =
	java.net.URLEncoder.encode("서울" , "UTF-8");
	
	Cookie cookie = new Cookie("address",address);
		response.addCookie(cookie);
	
	
	
	%>		
			
			
</body>
</html>