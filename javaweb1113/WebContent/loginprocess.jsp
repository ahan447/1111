<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 페이지</title>
</head>
<body>
<%
	//전송된 파라미터 읽기
	String id 		= request.getParameter("id");
	String pw	 	= request.getParameter("pw");
	
	//이전 페이지 주소를 찾아오기
	String url 	= (String)session.getAttribute("url");
	if(url == null){
		url = "./";
	}
	
	
	if("root".equals(id) && "1234".equals(pw)){
		//세선에 데이터 저장
		session.setAttribute("id", "root");
		session.setAttribute("nick" , "관리자");
		session.setAttribute("level" , "admin");
		//메인 페이지로 이동
		response.sendRedirect(url);
	}else if("user".equals(id) && "1234".equals(pw)){
		//세선에 데이터 저장
		session.setAttribute("id", "root");
		session.setAttribute("nick" , "유저");
		session.setAttribute("level" , "user");
		response.sendRedirect(url);
	}else{
		//세션에 데이터 삭제
		session.setAttribute("id", "null");
		session.setAttribute("nick" , "null");
		session.setAttribute("level" , "null");
		//로그인 실패 여부를 알려주기 위해서 데이터를 1개 저장
		session.setAttribute("login", "fail");
		//로그인 페이지로 이동		
		response.sendRedirect("login.jsp");
		
	}
%>
</body>
</html>