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
		//세션 초기화
		session.invalidate();
	
	%>
<div>로그아웃 성공<br/>
	3초 후 메인 페이지로</div>
</body>
<script>
	setTimeout(function(){
		//메인 페이지로 이동
		location.href = "./";
	}, 3000);

</script>
</html>