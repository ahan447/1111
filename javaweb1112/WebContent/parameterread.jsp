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
	//파라미터 읽기
	//존재하지 않는 파라미터 이름을 사용하면 null 리턴
	String query =
	request.getParameter("query");
String detail =
	request.getParameter("detail");

%>
<h3>Query : <%=query %></h3>
<div>Detail : <%=detail %></div>
</body>
</html>