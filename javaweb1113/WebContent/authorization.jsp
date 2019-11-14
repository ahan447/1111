<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인가 페이지</title>
</head>
<body>
	<%
		//로그인 확인 id=null -> 로그인 안된 상황 
		if(session.getAttribute("level") == null){
			session.setAttribute("login" , "authentication");
			session.setAttribute("url" , "authorization.jsp");
			response.sendRedirect("login.jsp");
		}else if("admin".equals
				(session.getAttribute("level")) == false){
			session.setAttribute("login" , "authorization");
			session.setAttribute("url" , "authorization.jsp");
			response.sendRedirect("login.jsp");
			
		}
		
		
		
		
		
		
	%>
<p>관리자만 확인할 수 있는 페이지</p>

</body>
</html>