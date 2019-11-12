<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답 페이지</title>
</head>
<body>
	<p>결과 페이지</p>
	 <%
	 	String msg = "Out 객체를 이용한 출력";
	 //out 객체를 이용한 출력
	 out.print("<p align='center'>");
	 out.print("메시지 :" + msg);
	 out.print("</p>");
	 
	 java.util.List<String> list
	 = new java.util.ArrayList<String>();
	 list.add("Application Programming");
	 list.add("Embedded Programming");
	 list.add("Web programming");
	 list.add("Mobile Programming");
	 list.add("Front End Programming");
	 
	 
	 out.print("<ul>");
	 //out 객체를 사용하지 않는 경우
	 for(String task : list){
		 %>
		 <li><%=task %></li>
		 <%}%>
	</ul>	 
	 
	<%
		out.print("<ol>");
	for(String task : list){
			out.print("<li>" + task +"</li>");
	}
	out.print("</ol>");
	
	
	%> 
	 
	
	 
	 
	 
</body>
</html>