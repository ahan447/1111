<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 출력</title>
</head>
<body>
 <%

int num =
		(Integer)session.getAttribute("num");
	String name =
	(String)session.getAttribute("name");
	
	out.println("<h3>" + num + "</h3><br/>");
	out.println("<h3>" + name + "</h3>");
%>

<!-- scope가 없으면
page, request, session, application 순으로 조회 -->
<br/>
<h3>${num}</h3><br/>
<!-- <h3>${name}</h3>  -->
<!-- 번위를 직접 지정 
session.getAttribute("name") 과 같은 문장-->
<h3>${sessionScope.name}</h3>
</body>
</html>