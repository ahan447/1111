<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 생성</title>
</head>
<body>
<%
	//문자열 List를 생성해서 session에 저장
	java.util.List<String> list =
	new java.util.ArrayList<String>();
	list.add("Java");
	list.add("C&C++");
	list.add("JavaScript");
	list.add("C#");
	list.add("Python");
	list.add("R");
	list.add("Swift");

	//세션에 저장
	session.setAttribute("list", list);
	
	//구분자가 있는 문자열을 만들고 세션에 저장
	String db = "Oracle,MySQL,MongoDB,SQLite3";
	session.setAttribute("db", db);
	
%>

</body>
	<a href="datadisplay.jsp">데이터 출력</a>
</html>