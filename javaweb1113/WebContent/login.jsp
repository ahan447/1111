<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	#disp{color:red;}
</style>
</head>
<body>
<div id='disp'>
<%
	String msg = "";
//로그인에 실패해서 온 것인지 아니면 바로 온것인지 판단
	if(session.getAttribute("login") != null
	&& session.getAttribute("login").equals("fail")){
		msg = "없는 아이디 or 비밀번호 틀림";
		//session.setAttribute("login", null);
	}else if(session.getAttribute("login") != null
	&& session.getAttribute("login").equals("authentication")){
		msg = "로그인 필요";
		
		}else if(session.getAttribute("login") != null
				&& session.getAttribute("login").equals("authorization")){
			msg = "관리자 권한 필요";
			}
	session.setAttribute("login", null);
%>
<%=msg %>
</div>
<form action='loginprocess.jsp' id ='loginform'
	method='post'>
	<input type='text' name='id'
	placeholder='아이디 입력'
	required='required' />
	<br/>
	<input type='password' name='pw'
	placeholder='비밀번호 입력'
	required='required' />
	<br/>
	</form>
	<a href="#">
	<img src='./images/login.png'
	id='login' width='150' height='80'/>
	</a>
</body>
<script>	
	document.getElementById('login')
	.addEventListener('click', function(e){
		//loginform 데이터 전송
		document.getElementById("loginform").submit();
	});
</script>
</html>