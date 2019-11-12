<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive - JSP  환경 설정</title>
<!-- 불필요한 공백을 제거해주는 디렉티브 설정 -->
<%@ page trimDirectiveWhitespaces="true" %>
<!-- java.util.Calendar 클래스를 줄여쓰기 위한 import -->
<%@ page import='java.util.*' %>

<%
		//자바코드를 작성할 수 있는 영역
		int result = 100 + 300;
 		Calendar cal = new GregorianCalendar();

%>

</head>
<body>
<p>1 23    1 2 3</p>
<p>result : <%=result %></p>
<p>cal : <%=cal %></p>
<!--  toString을 호출한 결과 -->
<!-- result의 값이 300이상이면 합겨 아니면 불합격 -->
<% 	if(result >= 300){%>

<%="합격" %>

<%}else{%>	

<%="불합격"%>	

<%}%>

<%
	List<String> list = new ArrayList<String>();
	list.add("Java - Servlet&JSP or Spring");
	list.add("C# - ASP.net");
	list.add("JavaScript - node.js");
	list.add("Python - Django, Flask");
	list.add("PHP - 라라벨");
	
	for(String imsi : list){
	%>
	<div><%=imsi %></div>	
		<% } %>
		
</body>
</html>






